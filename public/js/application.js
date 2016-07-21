$(document).ready(function() {
  // deletes posts on index
 $("article").on("click", ".delete", function(event) {
    event.preventDefault();
    $.ajax({
      type: 'DELETE',
      url: $(this).attr('action'),
    }).done(function(id){
      $("#" + id).remove();
    })
});

  // deletes reply on posts/show
 $("ul").on("click", "#delete", function(event) {
    event.preventDefault();
    $.ajax({
      type: 'DELETE',
      url: $(this).attr('action'),
    }).done(function(id){
      $("." + id).remove();
    })
});


  // edits reply on posts/show
  $("li").on("submit", "#edit", function(event) {
    event.preventDefault();
    var data = $("textarea[name='response']").val()
      $.ajax({
      type: 'PUT',
      url: $(this).attr('action'),
      data: {response: data}
    }).done(function(message){
       var elem = $(event.target).closest('li').children().first().siblings().first()
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
      var post_response = $("#posts>textarea").val();
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

    $(".downvote-posts").on("submit", function(event) {
    event.preventDefault();
      var vote_val = $(".downvote-posts>button[value]").val();
      var reply_id_val = $(this).attr('action');
      $.ajax({
      type: 'POST',
      url:  reply_id_val,
      data: {vote: vote_val}
    }).done(function(points){
      var elem = $(event.target).parent().find("span")
      $(elem).html(points);
    })
});

    $(".upvote-posts").on("submit", function(event) {
    event.preventDefault();
      var vote_val = $("button[value]").val();
      var reply_id_val = $(this).attr('action');
      $.ajax({
      type: 'POST',
      url:  reply_id_val,
      data: {vote: vote_val}
    }).done(function(points){
      var elem = $(event.target).parent().find("span")
      $(elem).html(points);
    })
});



});
