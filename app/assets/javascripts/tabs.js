$(function() {
	//クリックしたときのファンクションをまとめて指定
	$('.tab li').click(function() {
		//.index()を使いクリックされたタブが何番目かを調べ、
		//indexに代入する
		var index = $('.tab li').index(this);
		//コンテンツを一度すべて非表示にし、
		$('.content li').css('display','none');
		//クリックされたタブと同じ順番のコンテンツを表示
		$('.content li').eq(index).css('display','block');
		//一度タブについているクラスselectを消し、
		$('.tab li').removeClass('select');
		//クリックされたタブのみにクラスselectを付与
		$(this).addClass('select')
	});
});

$(function() {
	//クリックしたときのファンクションをまとめて指定
	$('.tab_user li').click(function() {
		//.index()を使いクリックされたタブが何番目かを調べ、
		//indexに代入する
		var index = $('.tab_user li').index(this);
		//コンテンツを一度すべて非表示にし、
		$('.content li').css('display','none');
		//クリックされたタブと同じ順番のコンテンツを表示
		$('.content li').eq(index).css('display','block');
		//一度タブについているクラスselectを消し、
		$('.tab_user li').removeClass('select');
		//クリックされたタブのみにクラスselectを付与
		$(this).addClass('select')
	});
});

$(function() {
	//クリックしたときのファンクションをまとめて指定
	$('.tab2 li').click(function() {
		//.index()を使いクリックされたタブが何番目かを調べ、
		//indexに代入する
		var index = $('.tab2 li').index(this);
		//コンテンツを一度すべて非表示にし、
		$('.content li').css('display','none');
		//クリックされたタブと同じ順番のコンテンツを表示
		$('.content li').eq(index).css('display','block');
		//一度タブについているクラスselectを消し、
		$('.tab2 li').removeClass('select');
		//クリックされたタブのみにクラスselectを付与
		$(this).addClass('select')
	});
});