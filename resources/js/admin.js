$().ready(function(){
	var $addCate = $('.sub-cate'),
		$cate = $('#cate');

	$addCate.click(function() {
		$.ajax({
			url: '/admin/addcate',
			data: {'cate': $cate.val()},
			type: 'POST'
		}).done(function(data) {
			// console.log('data');
			if(data) {
				location.reload(true);
			}
		}).fail(function(err){
			console.log('err=' + err);
		});

	})


	// post tui
	var $subTui = $('.sub-tui'),
		$title = $('#title'),
		$url = $('#url'),
		$select = $('.select'),
		$comment = $('#comment');

	$subTui.click(function() {
		var data = {
			title: $title.val(),
			url: $url.val(),
			comment: $comment.val(),
			cate: $select.val()
		};

		if($('.select').val() == 'music') {
			data.playurl = $('#playUrl').val();
		}
		$.ajax({
			url: '/admin/addTui',
			data: data,
			type: 'POST',			
		}).done(function(data) {
			console.log(data);
			// location.reload();
		}).fail(function(err){
			console.log(err);
		})
	});


	$('.select').change(function() {
		if($('.select').val() == 'music') {
			// $('.playurl').show();

		} else {
			// alert($('.select').val());
		}
	});
	
	// $('.pre').attr('href', );
})