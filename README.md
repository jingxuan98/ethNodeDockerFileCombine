# ethNodeDockerFileCombine

1. Build image `docker build -t eth-node-docker . --force-rm`

2. Docker run `docker run -it eth-node-docker`

3. DOcker run with volume mount `docker run -it -v $(pwd)/gethData:/var/lib/goethereum -v $(pwd)/prysmData:/var/lib/prysm eth-node-docker`