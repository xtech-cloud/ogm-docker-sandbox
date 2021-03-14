
```bash
docker run --restart=always --name=ogm-sandbox -d xtechcloud/ogm-sandbox:v3.12
```

更改端口和挂载卷
```bash
docker run --restart=always --name=ogm-sandbox -p 8822:22 -v /data/ogm:/ogm -d xtechcloud/ogm-sandbox:v3.12
```
