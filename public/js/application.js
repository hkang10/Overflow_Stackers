$(document).ready(function(){

  $('.answer').on('submit', function(event){
    event.preventDefault();
    var $form = $(this)
    var url = $form.attr('action');
    // console.log(url)
    var str = $form.serialize();

    // console.log(str);
<<<<<<< HEAD
=======

>>>>>>> 33a1025ea9b73208d3d6d0bbcad0277f85fec83e
    $.ajax({
      method: "POST",
      url: url,
      data: str
    }).done(function( response ) {
    $('#answer-list').prepend(response);
    $($form).trigger('reset');
<<<<<<< HEAD
=======

>>>>>>> 33a1025ea9b73208d3d6d0bbcad0277f85fec83e
    });
  });

    $('#answer-list').on('submit', '.comment', function(event){
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
    $('.comment-list').append(response);
    $($form).trigger('reset');
    });
  });
});
