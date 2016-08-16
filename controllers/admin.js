var db = require('../models/db');
var typeConfig = require('../config/type');

exports.cate = function(req, res) {
	res.render('admin/addcate');
}

exports.addcate = function(req, res) {
	var cate = req.body.cate;
	var data = {
		cate: cate,
		level: 1
	};
	var connect = db.connect();
	connect.query("INSERT INTO t_cate set ? ", data, function(err, rows) {
		if(err) {
			console.log('Error Is ' + err);
		}
	});

	res.end('yes');
}

exports.tui = function(req, res) {
	res.render('admin/tui');
}
exports.addTui = function(req, res) {
	console.log(typeConfig);
	var myDate = new Date();
	var Year = myDate.getYear(),
		Month = myDate.getMonth(),
		Day = myDate.getDay();
	var curDate = Year.toString() + Month.toString() + Day.toString();
	var type = req.body.type;
	console.log(typeConfig[type]);
	var data = {
		uuid: 'dddd',
		title: req.body.title,
		url: req.body.url,
		comment: req.body.comment,
		type: type,
		type_name: typeConfig[type]
	};

	console.log(data);
	var connect = db.connect();

	connect.query("INSERT INTO t_all set ? ", [data], function(err, rows) {
		if(err) {
			console.log("Error Is " + err);
			res.send('insert error');
		} else {
			res.send(rows);
		}
	})
	// res.end('yes');
}

