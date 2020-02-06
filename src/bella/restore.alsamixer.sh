

# restore alsamixer settings when logging in
# to save them in the first place use:
# alsactl store -f /home/flc/.config/asoundrc
# after you have configured it to your taste
alsactl -f ~/.config/asoundrc restore 2>/dev/null
