#!/bin/bash

envsubst '$DEFAULT_SERVER_NAME' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf