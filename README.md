### companion container for dshackle to generate needed certificates


### needs .env

```
SERVER_IP=<public IP>
SERVER_CA=<name of CA>
ORG=<name of Org>
ORG_UNIT=<name Org unit>
```


TODO: 

- add as companion container to dshackle to provide certs.

- doesnt generate certs if cert folder not empty. but if cert folder empty, it doesnt get added to github.
- dirty workaround:
```rm cert/.skel```
