#!/bin/bash

curl https://wrioos.com/main.js > /tmp/main.js
curl https://wrioos.com/start.js > /tmp/start.js


curl --insecure https://wrioos.com.s3.amazonaws.com/start.js | gunzip > /tmp/start.s3.js
curl --insecure https://wrioos.com.s3.amazonaws.com/main.js | gunzip > /tmp/main.s3.js

cd /tmp
diff -q main.js main.s3.js
diff -q start.js start.s3.js

echo "\nVersions on s3"
cat main.s3.js | grep "WRIO-InternetOS build"
cat start.s3.js | grep "WRIO-InternetOS build"

echo "\nVersions on wrioos.com"
cat main.js | grep "WRIO-InternetOS build"
cat start.js | grep "WRIO-InternetOS build"
