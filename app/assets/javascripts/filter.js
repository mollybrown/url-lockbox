$(document).ready(function(){

  $("#filter").keyup(function(){
    $("#all-links")
    .hide()
    .filter(":contains(" + $(this).val() + ")")
    .show();
  });

  $("#unread-links").on("click", function(event){
    event.preventDefault()
    $('.link.read').hide()
  });

  $("#read-links").on("click", function(event){
    event.preventDefault()
    $('.link.unread').hide()
  });

});
