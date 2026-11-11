#!/usr/bin/env python3
"""Exercise the toggle through its command-line interface without desktop changes."""
import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest

SCRIPT = Path(__file__).with_name("telegram-toggle.py")


class TelegramToggleTests(unittest.TestCase):
    def run_toggle(self, clients):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            fake = root / "hyprctl"
            fake.write_text('''#!/usr/bin/env python3
import json, os, sys
from pathlib import Path
args = sys.argv[1:]
with open(os.environ["CALLS"], "a") as f:
    f.write(json.dumps(args) + "\\n")
if args == ["clients", "-j"]:
    print(os.environ["CLIENTS"])
elif args == ["activeworkspace", "-j"]:
    print('{"id": 7}')
else:
    print("ok")
''')
            fake.chmod(0o755)
            telegram = root / "Telegram"
            telegram.write_text('#!/bin/sh\nprintf \'["launch"]\\n\' >> "$CALLS"\n')
            telegram.chmod(0o755)
            calls = root / "calls"
            env = dict(os.environ, PATH=f"{root}:{os.environ['PATH']}",
                       CLIENTS=json.dumps(clients), CALLS=str(calls))
            result = subprocess.run(["python3", str(SCRIPT)], env=env,
                                    capture_output=True, text=True)
            self.assertEqual((result.returncode, result.stdout, result.stderr), (0, "", ""))
            return [json.loads(line) for line in calls.read_text().splitlines()]

    def client(self, workspace):
        return {"class": "org.telegram.desktop", "address": "0x123",
                "workspace": {"id": 7 if workspace == "7" else -99, "name": workspace}}

    def test_launch_from_tray_or_when_not_running(self):
        self.assertEqual(self.run_toggle([]), [["clients", "-j"], ["launch"]])

    def test_hide_visible_window_without_closing(self):
        self.assertEqual(self.run_toggle([self.client("7")]), [
            ["clients", "-j"], ["activeworkspace", "-j"],
            ["dispatch", 'hl.dsp.window.move({window="address:0x123", workspace="special:telegram", follow=false})']])

    def test_restore_hidden_window_and_focus(self):
        self.assertEqual(self.run_toggle([self.client("special:telegram")]), [
            ["clients", "-j"], ["activeworkspace", "-j"],
            ["dispatch", 'hl.dsp.window.move({window="address:0x123", workspace="7", follow=false})'],
            ["dispatch", 'hl.dsp.focus({window="address:0x123"})']])

    def test_bring_window_from_another_workspace(self):
        self.assertEqual(self.run_toggle([self.client("2")])[-2:], [
            ["dispatch", 'hl.dsp.window.move({window="address:0x123", workspace="7", follow=false})'],
            ["dispatch", 'hl.dsp.focus({window="address:0x123"})']])


if __name__ == "__main__":
    unittest.main()
