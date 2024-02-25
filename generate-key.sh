#!/bin/bash

# Set the default values
# SSL_DIR: The directory to store the SSL files
SSL_DIR=${SSL_DIR:-"ssl"}
# SSL_KEY_PATH: The path to the key file
SSL_KEY_PATH=${SSL_KEY_PATH:-"${SSL_DIR}/cloudflare.key"}
# SSL_CSR_PATH: The path to the certificate signing request file
SSL_CSR_PATH=${SSH_CSR_PATH:-"${SSL_DIR}/cloudflare.csr"}
# SSL_CSR_SUBJ: The subject of the certificate signing request
SSL_CSR_SUBJ=${CSR_SUBJECTS:-"/C=XX/CN=iris"}

# Create the SSL directory if it doesn't exist
if [ ! -d ${SSL_DIR} ]; then
  mkdir -p ${SSL_DIR}
fi

# Generate a new key
openssl ecparam -name prime256v1 -genkey -noout -out ${SSL_KEY_PATH}

# Generate a certificate signing request
openssl req -new -key ${SSL_KEY_PATH} -subj ${SSL_CSR_SUBJ} -out ${SSL_CSR_PATH}