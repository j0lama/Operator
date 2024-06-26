#!/bin/bash

Help() {
    echo "Usage: $0 [Options...]" >&2
    echo "  -n, --name <Image name>     Name of the Docker image (Default j0lama/prophet:latest)"
    echo "  -s, --scratch               Build Docker image from scrach"
    echo "  -h, --help                  Show help menu"
    echo
    exit 1
}

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    -n|--name)
      NAME="$2"
      shift # past argument
      shift # past value
      ;;
    -s|--scratch)
      SCRATCH="--no-cache"
      shift # past argument
      ;;
    -h|--help)
      Help
      ;;
    *)
      echo "Unknown option $1"
      exit 1
      ;;
  esac
done

if [[ -z "$NAME" ]]; then
    NAME="j0lama/operator:latest"
fi

docker build --network=host $SCRATCH -t $NAME .
