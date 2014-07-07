$(document).ready(function(){
  $('#tab-container').easytabs();
  
  function addEventListener() {

    $('a#upvote').on('ajax:success', function(e, data) {
      var controller = new VotesWidget.Controller( new VotesWidget.View);
      var clickedObject = this;
      controller.processVoteClick(controller, data, clickedObject)
    }),

    $('a#downvote').on('ajax:success', function(e, data) {
      var controller = new VotesWidget.Controller( new VotesWidget.View);
      var clickedObject = this;
      controller.processVoteClick(controller, data, clickedObject)
    })
  };

  addEventListener();

})

