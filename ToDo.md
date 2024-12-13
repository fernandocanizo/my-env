# ToDo

## 2024-12-13

- remove old machines specifics
- review install script, started failing after I used `shellcheck` linter. Maybe it's I'm not using Bash but `sh`?
- devise a structure to separate installations for different shells
- devise a structure to separate installations for servers and my local machine

## 2021.05.06

- create `host`, `server` and `base`
  - `base` will have scripts with basic configuration which doesn't need
    anything extra installed on the machine
  - `server` will hold a common set of configuration for servers, probably
    linking mostly from `base`
  - `host` will hold folders named after the different hosts and inside each
    there will be configuration shell scripts. There will be a `common` to share
    common stuff to all hosts
  - I should probably clean old host's configuration once I deplete the things
    needed to copy on new hosts. Certainly xmodmap should be deleted, but
    careful, the first one still has many things I haven't copied to current
    host `bytor`

- cómo defino si una máquina es un home host o un server? -> quizá podría usar
  el usuario para comenzar, o también podría preguntar en el script de
  instalación y en base a la respuesta setear una variable inicial
  `FLC_IS_SERVER` a true/false. Y tener un fallback al usuario: siempre que sea
  `flc` será home-machine y si es cualquier otra cosa lo consideraré server.

- armar un formato para mantener la lista de aplicaciones copadas a instalar en
  nuevas máquinas, que permita extraer fácilmente los archivos a instalar y a la
  vez mantener descripciones humanas de cada programa, para saber por qué es
  importante cada uno y qué hace, y un script que extraiga los paquetes y los
  instale.

  - hacerlo para paquetes de sistema y para npm packages

- mover todos los directorios de aplicación a una carpeta `app`

- mover todos los archivos que van al $HOME a una carpeta `home`
