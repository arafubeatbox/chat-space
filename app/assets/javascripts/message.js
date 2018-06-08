$(function(){

  function buildHTML(message){
    var image = message.image_url ? message.image_url : null
    var img_tag =  image !== null ? `<img src="${image}", class: 'chatspace__main__chat-list__each__message__image' >` : ``
    var html = `<div class="chatspace__main__chat-list__each", data-message-id="${message.id}">
                  <h3 class="chatspace__main__chat-list__each__sender">${message.user_name}</h3>
                  <h4 class="chatspace__main__chat-list__each__date">${message.created_at}</h4>
                  <h4 class="chatspace__main__chat-list__each__message">
                    ${message.message}
                    ${img_tag}</h4>
                </div>`
    return html;
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(data){
      var html = buildHTML(data);
      $('.chatspace__main__chat-list').append(html);
      $('.chatspace__message-sender__contents__box').val('');
      $(".chatspace__message-sender__contents__button").prop('disabled', false);
      var p = $('.chatspace__main__chat-list__each').eq(-1).offset().top;
      $('.chatspace__main').animate({ scrollTop: p }, 'fast');
    })

    .fail(function(){
      alert('error');
    });
  });

  var interval = setInterval(function() {
      if (window.location.href.match(/\/chats\/\d+\/messages/)) {
        console.log(location.href);
    $.ajax({
      url: 'messages.json',
      method: 'GET',
      dataType: 'json'
    })
    .done(function(data) {
      var id = $('.chat').data('messageId');
      var insertHTML = '';
      data.forEach(function(message) {
        if (message.id > id ) {
          insertHTML += buildHTML(message);
        }
      });
      $('.chatspace__main__chat-list').prepend(insertHTML);
      console.log("成功！");
    })
    .fail(function(data) {
      alert('自動更新に失敗しました');
    });
  } else {
    clearInterval(interval);
   }} , 5000 );

});




