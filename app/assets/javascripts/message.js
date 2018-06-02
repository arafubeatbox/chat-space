$(function(){

  function buildHTML(message){
    var image = message.image_url ? message.image_url : null
    var img_tag =  image !== null ? `<img src="${image}", class: 'chatspace__main__chat-list__each__message__image' >` : ``
    var html = `<div class="chatspace__main__chat-list__each">
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

});




