#!/bin/bash

source ./buildtools.sh

docker build --force-rm -t $IMAGE_NAME .
exit_if_error "Could not build the image $IMAGE_NAME"
