# Configuration

* vim etc_opensips/opensips.cfg
change IP 
```
listen=hep_udp:IP:9069
listen=hep_tcp:IP:9069

```

* vim opt/rotation.ini
DATA_TABLE_ROTATION : delete data after day ?

```
[DATA_TABLE_ROTATION]
    #how long data keeps
    sip_capture_call = 2 #days
    sip_capture_registration = 2 # 10 days
    sip_capture_rest = 2 # 10 days
    rtcp_capture_all = 2 # days
    logs_capture = 2 # days
    report_capture = 2 # days
    webrtc_capture_all = 2 # days
    isup_capture_all = 2
```
# Build
```
docker build -t homer5:1.0 -f Dockerfile .
```

# Deploy
```
docker-compose up -d
```

# View logs
```
docker logs homer5 -f -n100
```
