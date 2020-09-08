# Add daily needed ssh keys
# conditionally load daily used keys

# github
$(ssh-add -l | grep -q 'SHA256:CE5a3EGQk6a0hdUFkfUEuMsdHWgkoThPbPm9uV9fJts') || ssh-add ~/.ssh/github_bella

# Esta key se está agregando sola no sé cómo
# aws
#$(ssh-add -l | grep -q 'SHA256:vWp8lGJrfIHwowO5MT4UBuso/hrlj23sP3/7LyV/tCg') || ssh-add ~/.ssh/flc-csw.pem

