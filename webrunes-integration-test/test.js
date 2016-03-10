/**
 * Created by michbil on 19.02.16.
 */

var page = require('webpage');


var domain = 'wrioos.com';
//domain = 'wrioos.local';
console.log("Started");

function OpenPage (page,url,cb) {
    console.log("Once again");
    page.open(url, function(status) {
        console.log("Status: " + status);
        setTimeout(cb,2000);
    });
}

setInterval(function () {
    var p = page.create();
    OpenPage(p,'http://'+domain,function () {
        OpenPage(p,'http://webgold.'+domain+'/add_funds',p.close)
    });
},20);

