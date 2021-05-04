#!/bin/bash

source ./buildtools.sh

docker run --rm -it --init --name restsql \
    -p 1972:1972 -p 52773:52773 \
    $IMAGE_NAME 