$( document ).ready(function(){
  $("body").on("click", ".mark-as-unread", markAsUnread)
})

function markAsUnread(e) {
  e.preventDefault();
  console.log("mark unread clicked!");

  var linkId = $(this).parents('.link').children('#link-id').data('linkId');
  console.log(linkId);

  $.ajax({
    method: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: false },
  }).then(updateLinkStatusToUnread)
    .fail(displayFailure);
}

function updateLinkStatusToUnread(link) {
  var $link = $(`.link[data-id=${link.id}]`)
  $link.find(".read-status").text("false")

  $link.removeClass('read').addClass('unread');
  $link.find('.mark-as-unread').removeClass('mark-as-unread').text("Mark as Read").addClass('mark-as-read');

  $link.css({"text-decoration":"none","background-color":"#ffffff"})
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
