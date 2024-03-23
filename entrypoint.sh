#!/bin/sh

PORT=${PORT:-8080}

exec socat TCP-LISTEN:${PORT},reuseaddr,fork OPENSSL:${TARGET_HOST}:${TARGET_PORT},verify=0

