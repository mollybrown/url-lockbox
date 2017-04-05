$(document).ready(function(){

  $("#filter").keyup(function(){
    $("#links > li")
    .hide()
    .filter(":contains(" + $(this).val() + ")")
    .show();
  });

  $("#unread-links").on("click", function(event){
  });

  $("#read-links").on("click", function(event){
  });

});
