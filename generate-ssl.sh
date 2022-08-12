#!/bin/bash

mkcert \
    -cert-file certs/local-cert.pem \
    -key-file certs/local-key.pem \
    h1.local \
    h2.local \
    code.local