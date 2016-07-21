$(document).ready(function() {
 $("article").on("click", ".delete", function(event) {
    event.preventDefault();
    $.ajax({
      type: 'DELETE',
      url: $(this).attr('action'),
    }).done(function(id){
      $("#" + id).remove();
    })
});

 $("li").on("click", "#delete", function(event) {
    event.preventDefault();
    $.ajax({
      type: 'DELETE',
      url: $(this).attr('action'),
    }).done(function(id){
      $("." + id).remove();
    })
});

});
