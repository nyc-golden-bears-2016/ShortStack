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

  $("li").on("click", "#edit", function(event) {
    event.preventDefault();
    var data = $("textarea[name='response']").val()
      $.ajax({
      type: 'PUT',
      url: $(this).attr('action'),
      data: {response: data}
    }).done(function(message){
      var elem = $(event.target).closest('li').children().first()
      $(elem).html(message)
    })
});


  $("li").on("click", "#best_answer", function(event) {
    event.preventDefault();
      var post_id_val = $("input[name='post_id']").val();
      var reply_id_val = $("input[name='reply_id']").val();
      $.ajax({
      type: 'PUT',
      url:  '/posts/best_answer',
      datatype: "json",
      data: {post_id: post_id_val,
             reply_id: reply_id_val}
    }).done(function(message){
      $(".username").append(message);
    })
});

    $("#posts").on("submit", function(event) {
    event.preventDefault();
      var post_id = $("input[name='post']").val();
      var post_response = $("textarea").val();
      $.ajax({
      type: 'POST',
      url:  '/replies/new',
      datatype: "json",
      data: {post: post_id,
             response: post_response}
    }).done(function(message){
      $(".all-replies").append(message);
    })
});

});
