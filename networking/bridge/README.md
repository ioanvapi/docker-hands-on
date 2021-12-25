# Docker bridge network

The default network driver. If you don’t specify a driver, this is the type of network you are creating. Bridge networks are usually used when your applications run in standalone containers that need to communicate.

User-defined bridge networks are best when you need multiple containers to communicate on the same Docker host.


```docker
# list networks
docker networl ls
```

```docker
docker network inspect bridge
```

```bash
{
    "Name": "bridge",        
    "Scope": "local",
    "Driver": "bridge",
    "IPAM": {
        "Driver": "default",
        "Options": null,
        "Config": [
            {
                # the ip address range for this network
                "Subnet": "172.17.0.0/16",
                "Gateway": "172.17.0.1"
            }
        ]
    },
    ....
    "Options": {        
        # the name of the network interface on host
        "com.docker.network.bridge.name": "docker0",        
    },
     # containers using this network
     "Containers": {
        {
            "Name": "cont1",        
            "MacAddress": "02:42:ac:11:00:03",
            "IPv4Address": "172.17.0.3/16",        
        },
        {
            "Name": "cont2",        
            "MacAddress": "02:42:ac:11:00:02",
            "IPv4Address": "172.17.0.2/16",        
        }
    },
}
```