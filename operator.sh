#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "USE: $0 <Operator Config File (JSON)>"
	echo "Example: .$0 config.json"
    exit 1
fi

docker run -ti --privileged --rm -v /dev/tun:/dev/tun -e CONFIG64="$(base64 $1)" j0lama/operator:latest ./initOperator.sh
