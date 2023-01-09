#!/usr/bin/env bash

set -Eeuo pipefail

if ! [ -x "$(command -v helm)" ]; then
  echo "helm is not installed. Please visit https://helm.sh/docs/intro/install/" >&2
  exit 1
fi

usage() {
  echo "
usage: ${0} [flags] [-h|--help]
Flags               Purpose
--apiKey            Required; The FusionAuth API key for the user's group
--endpoint          Optional; The Promscale remote write endpoint. Default value: https://metrics.cloud.aspenmesh.io/write
" >&2

    exit 1
}

apiKey=""
endpoint="https://metrics.cloud.aspenmesh.io/write"
while [[ $# -gt 0 ]]
do
  key="$1"
  case $key in
    --apiKey)
    apiKey="$2"
    shift # past argument
    shift # past value
    ;;
    --endpoint)
    endpoint="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    usage
    ;;
  esac
done

if [[ -z "${apiKey}" ]]; then
  cho "missing <apiKey> argument" >&2
  usage
fi

# Add the Aspen Mesh Helm Repository
helm repo add aspenmesh https://aspenmesh.github.io/aspenmesh-charts/
helm repo update

helm upgrade --install aspenmesh-collector aspenmesh/aspenmesh-collector -n aspenmesh --create-namespace --set apiKey=${apiKey} --set endpoint=${endpoint}

