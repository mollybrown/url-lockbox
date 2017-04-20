$(document).ready(function(){
  $("#add-link").on("click", createNewLink)

  function createNewLink(e) {
    e.preventDefault();
    var linkData = {
      link: {
        url: $("#link_url").val(),
        title: $("#link_title").val()
      }
    }
    $.ajax({
      method: "POST",
      url: "/api/v1/links",
      data: linkData
      })
      .done(function(formatNewLink) {
        $("#all-links").prepend(formatNewLink);
        $("#link_url").val("");
        $("#link_title").val("");
      });
  }
});
