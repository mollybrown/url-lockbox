$( document ).ready(function(){
  $("body").on("click", ".mark-as-unread", markAsUnread)
})

function markAsUnread(e) {
  e.preventDefault();

  var linkId = $(this).parents('.link').children(".hidden").text()

  $.ajax({
    method: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: false },
  }).then(updateLinkStatusToUnread)
    .fail(displayFailure);
}

function updateLinkStatusToUnread(link) {
  var $link = $(`.link[data-link-id=${link.id}]`)
  $link.removeClass('.mark-as-read').addClass('.mark-as-unread')
  $('.read').css({"text-decoration":"none","background-color":"none"})
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
