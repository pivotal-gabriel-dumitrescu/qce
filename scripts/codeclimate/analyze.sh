#!/bin/sh

cd codeclimate-cli

docker run -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(which docker):$(which docker) \
  -ti codeclimate/codeclimate version

docker run \
  --interactive --tty --rm \
  --env CODECLIMATE_CODE="$PWD" \
  --volume "$PWD":/code \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume /tmp/cc:/tmp/cc \
  codeclimate/codeclimate help

#codeclimate analyze -f text -e duplication > report-duplication.txt
#codeclimate analyze -f text -e eslint > report-eslint.txt
#codeclimate analyze -f text -e fixme > report-fixme.txt
#codeclimate analyze -f text -e nodesecurity > report-nodesecurity.txt
#codeclimate analyze -f text -e requiresafe > report-requiresafe.txt
