# Map Server
alias cd.tiles="cd ${HOME}/soft/webgis/tile-server"
alias cd.maps="cd ${HOME}/soft/webgis/map-server"
alias cd.lvt="cd ${HOME}/soft/webgis/lvt"
alias cd.visor="cd ${HOME}/soft/webgis/visor"
alias cd.turlgen="cd ${HOME}/soft/webgis/turlgen"
alias cd.tips="cd ${HOME}/soft/csw/tips-and-procedures"
alias cd.wiki="cd ${HOME}/soft/webgis/wiki-map-server"

# Liberador de Área
# Deprecated stuff
#alias cd.ldadmin=" cd ${HOME}/soft/liberador.de.areas/lda-admin"
#alias cd.newldadmin=" cd ${HOME}/soft/liberador.de.areas/new-lda-admin"
#alias cd.ldapp="cd ${HOME}/soft/liberador.de.areas/area-releaser"


alias recreate.mapserver.db='pushd . && cd.maps && dropdb mapserver && createdb mapserver && npm run "db:migrate:latest" && popd'

alias map_server.select.datasource="psql -d csw_map_server_test -c 'select * from public.datasource_info'"
#alias map_server.datasources.schema="psql -d csw_map_server_test -c 'set search_path=datasources; \d"

# el repo del Ministerio de Energía está muy relacionado con el crawler sel SEA
alias cd.minenergia="cd ${HOME}/soft/webgis/ministerio-de-energia"

# Viejo colector
alias cd.old-colector="cd ${HOME}/soft/colector/old-colector-server"

# Colector
alias cd.nviro-back="cd ${HOME}/soft/colector/nviro-back"
alias cd.nviro-front="cd ${HOME}/soft/colector/nviro-front"
alias cd.flora-collector="cd ${HOME}/soft/colector/flora-collector"
alias cd.fauna-collector="cd ${HOME}/soft/colector/fauna-collector"


# Reporte Ambiental
alias cd.icsara.forum="cd ${HOME}/soft/reporte.ambiental/icsara.forum"
alias cd.prefactibilidad="cd ${HOME}/soft/reporte.ambiental/prefactibilidad"



# Crawlers
alias cd.sea.crawler="cd ${HOME}/soft/crawlers/sea-crawler"
alias cd.specietor="cd ${HOME}/soft/crawlers/specietor"
alias cd.rugrats='cd /home/flc/soft/crawlers/rugrats'
alias cd.darwinion='cd /home/flc/soft/crawlers/crawler-darwinion'


# CSW
alias cd.template="cd ${HOME}/soft/csw/csw-template"
alias cd.rules="cd ${HOME}/soft/csw/csw-rules"
alias cd.kmlbuilder="cd ${HOME}/soft/csw/kml-builder"

alias t="python ${HOME}/local/t/t.py --task-dir ~/ToDo --list tasks"

alias cd.apps='cd /home/flc/soft/csw/csw-apps'

# Biota DB
#alias pgcli.aws.biota='pgcli --host proyectobiota.cy3tepzkndt3.us-west-2.rds.amazonaws.com -U csw proyectobiota'

# Prefactibilidad DB
alias pgcli.aws.pref-test='pgcli --host prefactibilidad.cy3tepzkndt3.us-west-2.rds.amazonaws.com -U csw test'
#alias pgcli.aws.pref-prod='pgcli --host prefactibilidad.cy3tepzkndt3.us-west-2.rds.amazonaws.com -U csw prod'

alias aws-pref-activity='pg_activity -U csw -d test -h prefactibilidad.cy3tepzkndt3.us-west-2.rds.amazonaws.com --rds'

alias cd.eecc="cd ${HOME}/soft/crawlers/eecc"

# Learning
alias cd.tcomb='cd /home/flc/soft/learning/2017.04.22,tcomb'

alias cd.fdd='cd /home/flc/soft/fuentes.de.datos/fdd'

# Otras aplicaciones
alias cd.cswmailer='cd /home/flc/soft/csw/mailer'

# fuzzy forms
alias cd.fuzzy-forms-server='cd /home/flc/soft/fuzzy-forms/fuzzy-forms-server'


