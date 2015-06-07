var db = require('../models/db'),
	Q = require('q');

exports.getTuiByNow = function(req, res) {
		var connect = db.connect();
		var data = {};
		
		function query(table) {
	        var defered = Q.defer();
	        connect.query('SELECT * FROM ?? WhERE to_days(date) = to_days(now())',[table],function(err, result) {
				defered.resolve(result);
	        });
	        return defered.promise;
		}
	    function queryBook(){
	        var defered = Q.defer();
	        connect.query('SELECT * FROM t_book WhERE to_days(date) = to_days(now())',function(err, result) {
	        	console.log('result');
				defered.resolve(result);
	        });
	        return defered.promise;
	    }
	    function queryMusic(){
	        var defered = Q.defer();
	        connect.query('SELECT * FROM t_music WhERE to_days(date) = to_days(now())', function(err, result) {
				defered.resolve(result);
	        });
	        return defered.promise;
	    }

	    function queryZhihu() {
	    	return query('t_zhihu');
	    }
	    function queryPeople() {
	    	return query('t_people');
	    }
	    function queryOs() {
	    	return query('t_os');
	    }
	    function queryNews() {
    		return query('t_news');
    	}
	    function queryWebsite() {
    		return query('t_website');
    	}
    	function queryMovie() {
    		return query('t_movie');
    	}
	    Q.all([queryBook(), queryMusic(), queryZhihu(), queryPeople(), 
	    		queryOs(), queryNews(), queryWebsite(),queryMovie()])
	    .then(function(results){
	    	data.book = results[0][0];
	    	data.music = results[1][0];
	    	data.zhihu = results[2][0];
	    	data.people = results[3][0];
	    	data.os = results[4][0];
	    	data.news = results[5][0];
	    	data.website = results[6][0];
	    	data.movie = results[7][0];
	    	console.log(results.length);

	    	var preDate = new Date();
	    	preDate.setDate(preDate.getDate() - 1);
	    	preDate = (new Date(preDate)).getTime();

	    	var nextDate = new Date();
	    	nextDate.setDate(nextDate.getDate() + 1);
	    	nextDate = (new Date(nextDate)).getTime();

			res.render('index', {
				data: data, 
				length: results.length, 
				setting: {
					pre: preDate,
					next: nextDate
				}
			});
	    });
}

// 按时间查询
exports.getTuiByDate = function(req, res) {
	var data = {};
	var connect = db.connect();
	console.log(req.params.date);
	var date = req.params.date;
	console.log(typeof date);
	var mydate = new Date(parseInt(date));
	var Year = mydate.getFullYear(),
		Month = mydate.getMonth() +1,
		Day = mydate.getDate();

	date = Year.toString() + '-' + Month.toString() + '-' + Day.toString();

	var sql = 'SELECT * FROM t_music WhERE '+"'"+ date + "'"+ ' = DATE(date)';

	function query(table) {
		var sql = 'SELECT * FROM '+ table +' WhERE '+"'"+ date + "'"+ ' = DATE(date)';
        var defered = Q.defer();
	        connect.query(sql, function(err, result) {
				defered.resolve(result);
	        });
	    return defered.promise;
	}

	
	function queryMusic() {
		return query('t_music');
	}
	function queryBook() {
		return query('t_book');
	}
	function queryZhihu() {
		return query('t_zhihu');
	}
    function queryPeople() {
    	return query('t_people');
    }
    function queryOs() {
    	return query('t_os');
    }
    function queryNews() {
    	return query('t_news');
    }
    function queryWebsite() {
		return query('t_website');
	}
    function queryMovie() {
    		return query('t_movie');
    }
    Q.all([queryBook(), queryMusic(), queryZhihu(), 
    	queryPeople(), queryOs(), queryNews(),queryWebsite(), queryMovie()])
    .then(function(results){
    	data.book = results[0][0];
    	data.music = results[1][0];
    	data.zhihu = results[2][0];
    	data.people = results[3][0];
    	data.os = results[4][0];
    	data.news = results[5][0];
    	data.website = results[6][0];
	    data.movie = results[7][0];

	    var preDate = new Date(parseInt(req.params.date));
	    	preDate.setDate(preDate.getDate() - 1);
	    	preDate = (new Date(preDate)).getTime();

	    var nextDate = new Date(parseInt(req.params.date));
	    	nextDate.setDate(nextDate.getDate() + 1);
	    	nextDate = (new Date(nextDate)).getTime();


		res.render('index', {
			data: data, 
			length: results.length,
			setting: {
				pre: preDate,
				next: nextDate
			}
		});
    });

}