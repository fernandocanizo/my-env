#!/usr/bin/env python3
"""Show Telegram here, or hide it without closing it (Super+Alt+T)."""
import json
import subprocess


def hypr(*args):
    return subprocess.check_output(["hyprctl", *args], text=True)


def main():
    clients = json.loads(hypr("clients", "-j"))
    telegram = next((client for client in clients
                     if client.get("class", "").lower() in
                     ("org.telegram.desktop", "telegram", "telegramdesktop")), None)
    if telegram is None:
        # Telegram's launcher hands off to an existing instance or starts one.
        subprocess.run(["Telegram"], check=True, stdout=subprocess.DEVNULL,
                       stderr=subprocess.DEVNULL)
        return

    workspace = json.loads(hypr("activeworkspace", "-j"))["id"]
    address = "address:" + telegram["address"]
    hiding = telegram["workspace"]["id"] == workspace
    destination = "special:telegram" if hiding else str(workspace)
    # Lua-configured Hyprland expects a dispatcher expression, not Hyprlang tokens.
    hypr("dispatch", "hl.dsp.window.move({window=" + json.dumps(address)
         + ", workspace=" + json.dumps(destination) + ", follow=false})")
    if not hiding:
        hypr("dispatch", "hl.dsp.focus({window=" + json.dumps(address) + "})")


if __name__ == "__main__":
    main()
