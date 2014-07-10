$(document).ready(function(){
  var controller = new VotesWidget.Controller( new VotesWidget.View);
  bindEvents(controller);
});


function bindEvents(controller) {

  $('a#upvote').on('ajax:success', function(e, data) {
    var clickedObject = this;
    controller.processVoteClick(controller, data, clickedObject)
  }),

  $('a#downvote').on('ajax:success', function(e, data) {
    var clickedObject = this;
    controller.processVoteClick(controller, data, clickedObject)
  })

   $('#tab-container').easytabs();

   $('.item-info').on("click", function(){
     var fullText = this.nextElementSibling
     if (fullText.style["display"] === "none") {
        fullText.style["display"] = "block";
     }
     else {
        fullText.style["display"] = "none";
    }
   });

};









