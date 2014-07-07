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
};









