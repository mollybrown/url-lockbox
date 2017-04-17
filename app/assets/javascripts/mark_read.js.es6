$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
  $("body").on("click", ".mark-as-unread", markAsUnread)
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

function updateLinkStatusToRead(link) {
  var $link = $(`.link[data-link-id=${link.id}]`);
  $link.removeClass('.mark-as-unread').addClass('.mark-as-read')
  $('.unread').css({"text-decoration":"line-through","background-color":"gray"})
}

function updateLinkStatusToUnread(link) {
  var $link = $(`.link[data-link-id=${link.id}]`)
  $link.removeClass('.mark-as-read').addClass('.mark-as-unread')
  $('.read').css({"text-decoration":"none","background-color":"none"})
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
