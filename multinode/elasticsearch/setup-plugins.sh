#!/bin/bash

# echo Ensure prerequisites plugins
# bin/elasticsearch-plugin list > /tmp/pluginlist.cache

# function ensurePlugin(){
#     plugin=$1
#     echo Check plugin $plugin
#     grep $plugin /tmp/pluginlist.cache \
#         || bin/elasticsearch-plugin install $plugin
# }
# ensurePlugin analysis-icu
# ensurePlugin analysis-kuromoji
# ensurePlugin analysis-smartcn
# ensurePlugin analysis-stempel

# rm /tmp/pluginlist.cache

echo Start elasticsearch
# from original Dockerfile
# https://github.com/elastic/elasticsearch/blob/v7.17.22/distribution/docker/src/docker/Dockerfile#L259
exec /bin/tini -- /usr/local/bin/docker-entrypoint.sh eswrapper
