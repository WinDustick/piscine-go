#!/bin/bash

curl -s "https://demo.01-edu.org/assets/superhero/all.json" | jq -r '.[] | select(.id==170) | "\(.name)\n\(.powerstats.power)\n\(.appearance.gender)"'