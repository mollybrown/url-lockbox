$(document).ready(function(){
  $("#add-link").on("click", createNewLink)

  function createNewLink(e) {
    e.preventDefault();
    $('.flash').empty();

    var linkData = {
      link: {
        url: $("#link_url").val(),
        title: $("#link_title").val()
      }
    }
    addLink(linkData);
  }

    function addLink(linkData) {
      $.ajax({
        method: "POST",
        url: "/api/v1/links",
        data: linkData
        })
        .done((response) => {
          $('#all-links').prepend(response);
          $('.flash').prepend("Link Added!")
          $("#link_url").val("");
          $("#link_title").val("");
        }).fail(error => $('.flash').prepend(error.responseJSON));
    }
  });
