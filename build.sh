#!/usr/bin/env bash

#---------------------------------------
# VARS
#---------------------------------------
REGISTRY_URL='docker-hub-int.mtnsat.io'
APP_NAME='bind_dns'
#---------------------------------------




[[ -z $BUILD_NUMBER ]] && {
  echo "My provide BUILD_NUMBER env var"
  echo "Exiting..."
  exit 1
}

main() {
  docker build -t "${REGISTRY_URL}"/"${APP_NAME}":"${BUILD_NUMBER}" . && \
  docker build -t "${REGISTRY_URL}"/"${APP_NAME}":latest . && \
  docker push "${REGISTRY_URL}"/"${APP_NAME}":"${BUILD_NUMBER}" && \
  docker push "${REGISTRY_URL}"/"${APP_NAME}":latest
}

time main
