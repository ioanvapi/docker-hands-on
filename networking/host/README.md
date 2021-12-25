# Docker host network

For standalone containers, remove network isolation between the container and the Docker host, and use the host’s networking directly.

Host networks are best when the network stack should not be isolated from the Docker host, but you want other aspects of the container to be isolated.

