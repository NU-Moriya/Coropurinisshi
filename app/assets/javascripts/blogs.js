/*(function () {
  $('.js-text_field').on('keyup', function () {
    var textField = $('.js-text_field');
    var title = $.trim(textField.val());
  });
});
*/

$(function () {
  $('.js-text_field').on('keyup', function () {
    var title = $.trim($(this).val());

    $.ajax({
      type: 'GET', // リクエストのタイプ
      url: '/blogs/searches', // リクエストを送信するURL
      data: {
        title: title
      }, // サーバーに送信するデータ
      dataType: 'json' // サーバーから返却される型
    })
    .done(function (data) {
      console.log(data); // dataを確認する
    })

    .done(function (data) {
      $('.js-messages li').remove();

    $(data).each(function (i, message) {
      $('.js-messages').append(
        `<li class="message"><a href="/messages/${message.id}">${message.title}</a></li>`
      );
  });
});
