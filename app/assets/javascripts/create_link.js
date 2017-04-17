$(document).ready(function(){
  $("#add-link").submit(function(event) {
     event.preventDefault();
     createNewLink();
  })
})

function createNewLink() {
  var linkData = {
    link: {
      url: $("#link-url").val(),
      title: $("#link_title").val()
    }
  }

  $.ajax({
    method: "POST",
    url: "/api/v1/links",
    data: LinkData
    })
    .done(function(formatNewLink) {
      $(".links").prepend(formatNewLink);
      $("#link_url").val("");
      $("#link_title").val("");
    });
}
