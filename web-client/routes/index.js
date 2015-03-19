var express = require('express');
var http = require('http');

var router = express.Router();

/* GET home page. */
router.get('/', function (req, res) {
    res.render('index',{menus:{index:true},partials: {header:'header',footer:'footer'}});
});
router.get('/cases', function (req, res) {
    res.render('cases/index',{menus:{collection:true},partials: {header:'header',page:'page',footer:'footer'}});
});
router.get('/cases/:id', function (req, res) {
    console.log(req.params.id);
    res.render('cases/details',{menus:{collection:true},partials: {header:'header',footer:'footer'}});
});

router.get('/designers', function (req, res) {
    res.render('designers/index',{menus:{design:true},partials: {header:'header',page:'page',footer:'footer'}});
});
router.get('/designers/:id', function (req, res) {
    console.log(req.params.id);
    res.render('designers/details',{menus:{design:true},partials: {header:'header',page:'page',footer:'footer'}});
});

module.exports = router;
