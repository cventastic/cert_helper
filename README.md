### companion container to create ca and certs

based on https://github.com/square/certstrap


### needs .env
```
cp .env_skel .env
```
content:
```
SERVER_IP=<public IP>
SERVER_CA=<name of CA>
ORG=<name of Org>
ORG_UNIT=<name Org unit>
```


TODO: 

- add as companion container to provide certs.
- doesnt generate certs if cert folder not empty. but if cert folder empty, it doesnt get added to github.
- dirty workaround:
```rm cert/.skel```
