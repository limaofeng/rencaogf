var express = require('express');
var http = require('http');

var router = express.Router();

/* GET home page. */
router.get('/', function (req, res) {
    res.render('index',{menus:{index:true},partials: {header:'header',footer:'footer'}});
});
router.get('/collection', function (req, res) {
    res.render('collection',{menus:{collection:true},partials: {header:'header',page:'page',footer:'footer'}});
});
router.get('/collection_detail', function (req, res) {
    res.render('collection_detail',{menus:{collection:true},partials: {header:'header',footer:'footer'}});
});

router.get('/design', function (req, res) {
    res.render('design',{menus:{design:true},partials: {header:'header',page:'page',footer:'footer'}});
});
router.get('/design_detail', function (req, res) {
    res.render('design_detail',{menus:{design:true},partials: {header:'header',page:'page',footer:'footer'}});
});

module.exports = router;
