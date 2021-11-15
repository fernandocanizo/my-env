# Add daily needed ssh keys
# conditionally load daily used keys

# personal github account: fernandocanizo
$(ssh-add -l | grep -q 'SHA256:oTfHnTKEpShyYxdpZdhFf844Vzx+c3otp8rn0Y/WM7k') || ssh-add ~/.ssh/bytor-github-id-rsa

# work github account: flc-globant
$(ssh-add -l | grep -q 'SHA256:BRQlayg5hwAf6znrb09Tst7f6Cj31fKxa3vgK11oarw') || ssh-add ~/.ssh/bytor-globant-github-id-rsa

# Esta key se está agregando sola no sé cómo
# aws
#$(ssh-add -l | grep -q 'SHA256:vWp8lGJrfIHwowO5MT4UBuso/hrlj23sP3/7LyV/tCg') || ssh-add ~/.ssh/flc-csw.pem

