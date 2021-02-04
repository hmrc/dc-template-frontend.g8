#!/usr/bin/env bash

#Creates a sandbox folder to generate test repository
setup_sandbox() {
	echo "INFO: Running 'SBT clean' command to clean the target folder"
	sbt clean

	echo "INFO: Setting TEMPLATE_DIRECTORY as $PWD"
	TEMPLATE_DIRECTORY=$PWD
	SANDBOX="$TEMPLATE_DIRECTORY/target/sandbox"
	REPO_NAME="some-service-frontend"

	echo "INFO: Creating folder: $SANDBOX"
	mkdir -p $SANDBOX
	cd $SANDBOX
}

generate_repo_from_template() {
	echo "INFO: Using g8 template to generate new frontend service repository: $REPO_NAME."
	g8 file:///$TEMPLATE_DIRECTORY --serviceName="Some Service Frontend" --serviceTargetPort="9999" -o $REPO_NAME "$@"
}

#The template uses sbtAutoBuildPlugin which requires repository.yaml, licence.txt and an initial git local commit to compile.
initialize_repo() {
	echo "INFO: Initializing repository for sbtAutoBuildPlugin with repository.yaml, licence.txt and an initial git commit"
	cd "$SANDBOX"/"$REPO_NAME"
	cp $TEMPLATE_DIRECTORY/repository.yaml .
	cp $TEMPLATE_DIRECTORY/LICENSE .
	git init
	git add .
	git commit -m "initial commit"
}

run_test() {
	echo "INFO: Changing directory to "$SANDBOX"/"$REPO_NAME""
	cd "$SANDBOX"/"$REPO_NAME"
	echo "INFO: Starting $REPO_NAME tests"
	sbt clean test
	echo "INFO: Completed $REPO_NAME tests"
}

if [[ -f ./build.sbt ]] && [[ -d ./src/main/g8 ]]; then
	setup_sandbox
	generate_repo_from_template
	initialize_repo
	run_test
else
	echo "WARNING: run the script ./test.sh in the template root folder"
	exit -1
fi
