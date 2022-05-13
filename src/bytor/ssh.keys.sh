
ssh-add -l | grep -q 'ZI9ddkjS81nw2s1bvZ3CF8m31Jc6SlOV4xxRq3AFNOQ'
if [[ ! $? ]]; then
  ssh-add -q ~/.ssh/bytor-github-personal-rsa
fi

ssh-add -l | grep -q 'FU0vKu/vlZUhfGmHfv8xb6IgTrz1vw4jQYRbyk4P4yo'
if [[ ! $? ]]; then
  ssh-add -q ~/.ssh/bytor-github-globant-ed25519-no-pass
fi
