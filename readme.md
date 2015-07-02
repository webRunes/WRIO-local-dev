#WRIO local development package
```
git clone --recursive https://github.com/webRunes/WRIO-local-dev.git
cd WRIO-local-dev
npm i
npm start
```
[http://localhost:3000/](http://localhost:3000/)


#WRIO docker development package


docker build -t wrio_local_dev .
docker run -p 5000-5005:5000-5005 -p 80:80 -t -i wrio_local_dev

Powered by [Open Copyright](http://opencopyright.webrunes.com)
