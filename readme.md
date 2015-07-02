#WRIO local development package
```
git clone --recursive https://github.com/webRunes/WRIO-local-dev.git
cd WRIO-local-dev
npm i
npm start
```
[http://localhost:3000/](http://localhost:3000/)


#WRIO docker development package

```

boot2docker ip


```

Place in hosts file

```

192.168.59.103 titter.wrioos.local
192.168.59.103 login.wrioos.local
192.168.59.103 chess.wrioos.local
192.168.59.103 storage.wrioos.local

```

```
docker build -t wrio_local_dev .
docker run -p 5000-5005:5000-5005 -p 80:80 -t -i wrio_local_dev
```
Powered by [Open Copyright](http://opencopyright.webrunes.com)
