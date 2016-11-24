var img_count = 0,
img_array = [];
$(function() {
  $('form').after("<span id='dum'></span>"); //inputタグの後ろに空白のspanタグを入れる
});

function change() {//inputタグのchangeイベントが発火したら呼ぶ
    var file = $('#' + img_count).prop('files'); //とってきたファイルを変数に束縛
    $(file).each(function(i) {

      // 画像以外は処理を停止
      if (! file[i].type.match('image.*')) {
        $('span').html('');
        return;
      }

      // 画像表示
      var reader = new FileReader();
      reader.onload = function() {  //読み込みが成功したら実行
        /*画像をプレビュー表示する*/
        var img_src = $('<img id=img_' + img_count + ' src=' + reader.result + ' />');
        $('#dum').append(img_src).trigger('create');

      }
      reader.readAsDataURL(file[i]);/*読み取ったデータをurlに変換*/
      //img_count = img_count + 1;/*これを消さないと条件によっては動かなかった*/
    });
}