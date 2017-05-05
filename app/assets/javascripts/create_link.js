$(document).ready(function(){
  $("#add-link").on("click", createNewLink)

  function createNewLink(e) {
    e.preventDefault();
    $('.errors').empty();

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
          $("#link_url").val("");
          $("#link_title").val("");
        }).fail(error => $('.errors').prepend(error.responseJSON));
    }
  });
