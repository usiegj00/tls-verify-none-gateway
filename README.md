# TLS Verify None Gateway

On occasion, it is necessary to allow private TLS-free access for internal services. This simple socat-in-a-container does just that.

Sample Usage
---
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: tls-verify-none-gateway
spec:
  replicas: 1
  selector:
    matchLabels:
      app: tls-verify-none-gateway
  template:
    metadata:
      labels:
        app: tls-verify-none-gateway
    spec:
      containers:
      - name: socat-bridge
        image: yourregistry/socat-bridge:latest
        ports:
        - containerPort: 8080
        env:
        - name: PORT
          value: "8080"
        - name: TARGET_HOST
          value: "some-host.com"
        - name: TARGET_PORT
          value: "18240"
```
