dockerRun() {
  if [ -n "$1" ]; then
    sudo docker run -t -i $1 /bin/bash
  fi
}

dockerBuild() {
  if [ -n "$1" ]; then
    sudo docker build -t="$1" .
  fi
}

dockerImages() {
  sudo docker images
}

dockerContainers() {
  sudo docker ps -a
}

dockerRm() {
  sudo docker rm $(sudo docker ps -a -q)
}

dockerRmi() {
  sudo docker rmi $(sudo docker images | grep "^<none>" | awk "{print $3}")
}
