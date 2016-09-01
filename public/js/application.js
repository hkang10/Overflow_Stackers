$(document).ready(function(){

  $('.answer').on('submit', function(event){
    event.preventDefault();
    var $form = $(this)
    var url = $form.attr('action');
    // console.log(url)
    var str = $form.serialize();

    // console.log(str);
    $.ajax({
      method: "POST",
      url: url,
      data: str
    }).done(function( response ) {
      $('#answer-list li:nth-child(1)').text(response);
      console.log(response);
    });
  })
});
