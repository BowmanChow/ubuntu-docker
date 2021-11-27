### build args
```
--progress=plain
--build-arg ALL_PROXY=socks5://docker.for.mac.localhost:1086  --build-arg http_proxy=http://docker.for.mac.localhost:1087 --build-arg https_proxy=http://docker.for.mac.localhost:1087
```
### run args
```
-v vscode-server:/root/.vscode-server
-e DISPLAY=docker.for.mac.localhost:0
-e ALL_PROXY=socks5://docker.for.mac.localhost:1086 -e http_proxy=http://docker.for.mac.localhost:1087 -e https_proxy=http://docker.for.mac.localhost:1087
```