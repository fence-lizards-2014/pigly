VotesWidget.Controller = function(view) {
  this.view = view
 }

 VotesWidget.Controller.prototype.processVoteClick = function(controller, data, clickedObject) {
  controller.view.changeVotes(data, clickedObject)
}






