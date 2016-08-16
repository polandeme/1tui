var controllers = require('../controllers');

/**
 * 全局路由
 * @param app: express
 * @date 02 June. 2015
 * @author Polande
 */

module.exports = function(app) {
	app.get('/', controllers.home.getTuiByNow);
	app.get('/admin/addcate', controllers.admin.cate);
	app.get('/admin/tui', controllers.admin.tui);
	// app.get('/admin/tui', controllers.admin.tui);
	app.get('/:date', controllers.home.getTuiByDate);
	app.post('/admin/addTui', controllers.admin.addTui);


	//api
	app.get('/api/now', controllers.home.getTuiByNowAPI);
}