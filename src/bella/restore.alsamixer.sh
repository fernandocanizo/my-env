

# restore alsamixer settings when logging in
# to save them in the first place use:
# alsactl store -f /home/flc/.config/asoundrc
# after you have configured it to your taste
# 2020.04.16 es muy molesto que se me baje el sonido cada vez que arranco una terminal
# esto debería quedar en la conf de login, no la de cada vez que inicio un shell
# no recuerdo si ese era .bashrc o .bash_profile
#alsactl -f ~/.config/asoundrc restore 2>/dev/null
