$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
})

function markAsRead(e) {
  e.preventDefault();

  var linkId = $(this).parents('.link').children(".hidden").text()

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateLinkStatusToRead)
    .fail(displayFailure);
}

function updateLinkStatusToRead(link) {
  var $link = $(`.link[data-link-id=${link.id}]`);
  $link.removeClass('.mark-as-unread').addClass('.mark-as-read')
  $('.unread').css({"text-decoration":"line-through","background-color":"gray"})
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
