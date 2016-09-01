$(document).ready(function(){

  $('form[class="answer"]').on('submit', function(event){
    event.preventDefault();
    var url = $(this).attr('action');
    var str = $(this).serialize();

    console.log(str);
    $.ajax({
      method: "POST",
      url: url,
      data: str
    }).done(function( response ) {
      // $(response).appendTo('#answer-list');
      console.log(response);
    });
  })
});
