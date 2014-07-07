$(document).ready(function(){

  /* I like what's going on here, but this is a bit off...and possibly the MVC
   * may not be the right pattern here (yes, I know, this is coming from me!).
   *
   * Discuss in person
   *
   */
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

