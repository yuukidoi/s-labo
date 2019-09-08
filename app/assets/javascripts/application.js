// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .



$(function(){
  $fileField = $('#file')
 
  // 選択された画像を取得し表示
  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#img_field");
 
    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});



$(document).on('change', 'input[type="file"]', function(e)  {

    // ファイル情報を取得
    var fileData = e.target.files[0];

    //サムネイル表示エリアのエレメント取得
    var object = $(this).parent().children('object').get(0);

    // FileReaderオブジェクトを使ってファイル読み込み
    var reader = new FileReader();
    // ファイル読取り成功時処理
    reader.onload = function() {

        //ノードの複製
        var cln = object.cloneNode(true);

        //複製したノードのdata要素をにFileAPIの読み込み結果をセット
        cln.setAttribute("data",reader.result);

        object.parentNode.replaceChild(cln, object);
    }
    // ファイル読み込みを実行
    reader.readAsDataURL(fileData);
});
