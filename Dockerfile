FROM intersystemsdc/irisdemo-base-irisint-community:version-1.9.6U

ARG IRIS_PROJECT_FOLDER_NAME=src

# Adding source code that will be loaded by the installer
ADD --chown=irisowner:irisuser ./${IRIS_PROJECT_FOLDER_NAME}/ $IRIS_APP_SOURCEDIR
ADD --chown=irisowner:irisuser ./swagger /swagger

# Running the installer. This will load the source from our project.
RUN /usr/irissys/demo/irisdemoinstaller.sh

