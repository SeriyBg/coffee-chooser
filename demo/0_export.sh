#!/bin/bash

CURRENT_LOCATION="$(dirname $0)/";
echo $CURRENT_LOCATION
export COFFEE_SERVICE="${CURRENT_LOCATION}../coffee-chooser-service/"
echo $COFFEE_SERVICE
export COFFEE_UI="${CURRENT_LOCATION}../coffee-chooser-ui/"
echo $COFFEE_UI
