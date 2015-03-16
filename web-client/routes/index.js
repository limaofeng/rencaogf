var express = require('express');
var http = require('http');

var router = express.Router();

/* GET home page. */
router.get('/', function (req, res) {
    /*
    var options = {
        hostname: '127.0.0.1',
        port: 10086,
        path: '/pay/pay_callback',
        method: 'GET'
    };
    var req = http.request(options, function (res) {
        console.log('STATUS: ' + res.statusCode);
        console.log('HEADERS: ' + JSON.stringify(res.headers));
        //res.setEncoding('utf8');
        res.on('data', function (chunk) {
            console.log('BODY: ' + chunk);
            res.render('index', {title: '康健 - 第一个NodeJS项目', paths: []});
        });
    });
    req.on('error', function (e) {
        console.log('problem with request: ' + e.message);
    });
    req.end();
    */
    res.render('index',{partials: {header:'header',footer:'footer'}});
});

module.exports = router;
