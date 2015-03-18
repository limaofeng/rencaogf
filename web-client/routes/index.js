var express = require('express');
var http = require('http');

var router = express.Router();

/* GET home page. */
router.get('/', function (req, res) {
    res.render('index',{menus:{index:true},partials: {header:'header',footer:'footer'}});
});

router.get('/collection', function (req, res) {
    res.render('index',{menus:{collection:true},partials: {header:'header',footer:'footer'}});
});
router.get('/collection_detail', function (req, res) {
    res.render('index',{menus:{collection_detail:true},partials: {header:'header',footer:'footer'}});
});

router.get('/design', function (req, res) {
    res.render('index',{menus:{design:true},partials: {header:'header',footer:'footer'}});
});
router.get('/design_detail', function (req, res) {
    res.render('index',{menus:{design_detail:true},partials: {header:'header',footer:'footer'}});
});

module.exports = router;
