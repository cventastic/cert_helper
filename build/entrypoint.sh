#!/bin/bash

# generate CA, Cert, Key for dshackle tls
# https://github.com/emeraldpay/dshackle/blob/master/docs/08-authentication.adoc

if [ -z "$(ls -A /out)" ]; then

  certstrap/certstrap init --common-name "$SERVER_CA" --passphrase "" -o "$ORG" -ou "$ORG_UNIT CA"
  openssl pkcs8 -topk8 -inform PEM -outform PEM -in out/$SERVER_CA.key -out out/$SERVER_CA.p8.key -nocrypt
  certstrap/certstrap request-cert -ip $SERVER_IP --common-name $SERVER_IP --passphrase ""  -o "$ORG" -ou "$ORG_UNIT Server"
  certstrap/certstrap sign $SERVER_IP --CA $SERVER_CA
  openssl pkcs8 -topk8 -inform PEM -outform PEM -in out/$SERVER_IP.key -out out/$SERVER_IP.p8.key -nocrypt

  # generate self signed key for dshackle signed response
  # https://purple-sea-cb0.notion.site/Provider-setup-instructions-8f49f0ec2ecc4e718c3c35c20889966a

  openssl ecparam -name prime256v1 -genkey -noout -out /out/private-key.pem
  openssl pkcs8 -topk8 -inform PEM -outform PEM -in /out/private-key.pem -out /out/private-key-test.pem -nocrypt
  openssl ec -in /out/private-key-test.pem -pubout -out /out/pubkey.pem

  echo "done generating certs"

else
  echo "!!! not generating certs, folder not empty !!!"
fi
