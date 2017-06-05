#WRIO local development package

Please refer wiki for local development instructions
[Local development of WRIO-InternetOS front end](https://github.com/webRunes/WRIO-InternetOS/wiki/Deploy-on-localhost)

# Clone your repositories there

Note for Windows users: [Python](https://www.python.org/downloads/release/python-2713/) must be installed. Please make sure, python is included in system path.
Note: Fork and replace "webRunes" in the URLs below with your github name(NOTE: make sure to clone all repositories in WRIO-local-dev folder)

If you're going to work on front-end only this will be enough
```
git clone https://github.com/webRunes/WRIO-local-dev
cd WRIO-local-dev

git clone https://github.com/webRunes/WRIO-InternetOS
git clone https://github.com/webRunes/Default-WRIO-Theme
```

If you're going to work on back-end too, clone backend repos as well

```
git clone https://github.com/webRunes/Core-WRIO-App
git clone https://github.com/webRunes/Login-WRIO-App
git clone https://github.com/webRunes/Storage-WRIO-App
git clone https://github.com/webRunes/webGold-WRIO-App
git clone https://github.com/webRunes/Chess-WRIO-Game
git clone https://github.com/webRunes/Plus-WRIO-App
git clone https://github.com/webRunes/Titter-WRIO-App
```

install yarn, if you don't have one

```
npm install -g yarn
cd WRIO-InternetOS
yarn
npm run devserver
```
Please add following entries to your hosts file
```
127.0.0.1 webgold_d.wrioos.com
127.0.0.1 core_d.wrioos.com
127.0.0.1 titter_d.wrioos.com
```

Now each time you start frontend server, run
```
cd WRIO-InternetOS
npm run devserver
```


Start
```
http://localhost:3033/
```

Port 80 must be available. In case it's not you may need to stop "Web Deployment Agent Service" at "View local services":
[http://www.ferolen.com/blog/microsoft-httpapi2-0-use-port-80-cannot-start-wamp-apache/](http://www.ferolen.com/blog/microsoft-httpapi2-0-use-port-80-cannot-start-wamp-apache/)
