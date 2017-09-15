#!/bin/bash

if [[ -z "$(ls -A $PWD 2>/dev/null)" ]]; then
	adonis new . $adonisFlags
	sed -i -e "s/HOST=.*/HOST=0.0.0.0/g" .env
	sed -i -e "s/PORT=.*/PORT=80/g" .env
fi

if [[ -z "$(ls -A $PWD | grep .env)" ]]; then
	echo "no .env file found."
	exit 1
fi

source .env

if [[ "$NODE_ENV" == "production" ]]; then
	adonis serve
else
	adonis serve --dev 
fi