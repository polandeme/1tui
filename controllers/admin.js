var db = require('../models/db');

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
	var myDate = new Date();
	var Year = myDate.getYear(),
		Month = myDate.getMonth(),
		Day = myDate.getDay();
	var curDate = Year.toString() + Month.toString() + Day.toString();
	console.log(curDate);
	var data = {
		sid: 'dddd',
		title: req.body.title,
		url: req.body.url,
		comment: req.body.comment,
		daid: 'curDate'
	};
	console.dir(req.body);
	if(req.body.cate == 'music') {
		data.play_url = req.body.playurl;
	};
	var table = 't_' + req.body.cate;
	var connect = db.connect();
	console.log(table);
	connect.query("INSERT INTO ?? set ? ", [table, data], function(err, rows) {
		if(err) {
			console.log("Error Is " + err);
		}
	})
	res.end('yes');
}

