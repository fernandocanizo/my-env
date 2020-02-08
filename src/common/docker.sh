dockerStopAll () {
  areThereContainers=$(docker ps -aq)
  if [[ -n ${areThereContainers} ]]; then
    docker stop $(docker ps -aq);
  fi
}

dockerRmAll () {
  areThereContainers=$(docker ps -aq)
  if [[ -n ${areThereContainers} ]]; then
    docker rm $(docker ps -aq);
  fi
}

dockerClean () {
  dockerStopAll && dockerRmAll;
}
