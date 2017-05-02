$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
})

function markAsRead(e) {
  e.preventDefault();
  console.log("mark read clicked!");

  var linkId = $(this).parents('.link').children('#link-id').data('linkId');
  console.log(linkId);

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateLinkStatusToRead)
    .fail(displayFailure);
}

function updateLinkStatusToRead(link) {
  var $link = $(`.link[data-id=${link.id}]`);
  $link.find(".read-status").text("true")

  $link.removeClass('unread').addClass('read');
  $link.find('.mark-as-read').removeClass('mark-as-read').text("Mark as Unread").addClass('mark-as-unread');

  $link.css({"text-decoration":"line-through","background-color":"#f2dede"})
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
