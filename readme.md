#WRIO local development package
```
git clone --recursive https://github.com/webRunes/WRIO-local-dev.git
cd WRIO-local-dev
npm i
npm start
```
[http://localhost:3000/](http://localhost:3000/)


#WRIO docker development package

You can run development server on your machine using boot2docker on Windwos and MacOS. Services will be available at test domain wrioos.local,
to setup this domain you need to add record to your /etc/host file.

First get ip of boot2docker instance

```
boot2docker ip
```

For example our boot2docker ip is 192.168.59.103 . Place this ip in hosts file:

```
192.168.59.103 wrioos.local
192.168.59.103 dev.wrioos.local
192.168.59.103 webgold.wrioos.local
192.168.59.103 titter.wrioos.local
192.168.59.103 login.wrioos.local
192.168.59.103 chess.wrioos.local
192.168.59.103 storage.wrioos.local
```

You must place corresponding config.json inside each of this folder to run development environment successfully

```
Titter-WRIO-App
Login-WRIO-App
webGold-WRIO-App
Storage-WRIO-App
Chess-WRIO-Game
```

We are using docker-compose to run all WRIO services together on one machine, if you are using boot2docker you can use this command, to install docker-compose on your boot2docker virtual machine

```
boot2docker ssh
tce-load -wi python && curl https://bootstrap.pypa.io/get-pip.py | sudo python - && sudo pip install -U docker-compose
```
then you can cd your wrio-local-dev directory inside boot2docker shell and use

```
cd /Users/username/WRIO-local-dev/
docker-compose build
```
to build all apps and

```
docker-compose up
```
to run them

Your services now will be accessible at http://wrioos.local http://titter.wrioos.local, http://titter.wrioos.local etc...

Powered by [Open Copyright](http://opencopyright.webrunes.com)
