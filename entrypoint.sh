#!/bin/bash
set -e

# When running dev env init go vendors
if [ "$1" = 'realize' ]; then
	# Create a dep project, and run `ensure`, which will pull in all
	# of the dependencies within this directory.
	if [ ! -f "Gopkg.toml" ]; then
		dep init
	fi

	dep ensure
fi

exec "$@"