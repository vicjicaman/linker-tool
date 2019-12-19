#!/bin/bash

#Set the linker workspace path, defaults to ~/repoflow/linker/home
export LOCAL_WORKSPACE=~/repoflow/linker/home
export LOCAL_GRAPH_BOOTSTRAP_SERVICE_PORT=16005

export LOCAL_VERSION_BOOTSTRAP=1.70.2-master #module @nebulario/linker-local-bootstrap-graph
export LOCAL_VERSION_GRAPH=1.70.4-master #module repoflow/linker-local-handler-graph-container
export LOCAL_VERSION_WEB=1.70.4-master #module repoflow/linker-local-handler-web-container
export LOCAL_VERSION_WORKER=1.70.1-master #module repoflow/linker-local-worker-graph-container

echo "Starting..."
echo "{\"dependencies\":{\"@nebulario/linker-local-bootstrap-graph\":\"${LOCAL_VERSION_BOOTSTRAP}\"}}" > package.json
yarn install --production=true
node node_modules/@nebulario/linker-local-bootstrap-graph/dist/index.js
