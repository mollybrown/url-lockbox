$(document).ready(function(){
  $("#add-link").submit(function(event) {
     event.preventDefault();
     createNewLink();
  })
}

function createNewLink() {
  var linkData = {
    link: {
      url: $("#link_url").val()
      title: $("#link_title").val()
    }
  }

  $.ajax({
    type: "POST",
    url: "/",
    data: LinkData
    })
    .done(function(formatNewLink) {
      $(".link").prepend(formatNewLink);
      $("#link_url").val("");
      $("#link_title").val("");
    });
}
