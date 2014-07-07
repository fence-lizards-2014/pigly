VotesWidget.View = function() {
  this.targetPercentageTag = '#positive_votes'
}

VotesWidget.View.prototype.changeVotes = function(data, clickedObject) {
  var target = this.targetPercentageTag;
  clickedObject.parentNode.querySelector(target).innerHTML = data.percentage + "%"
  clickedObject.parentNode.querySelector(target).innerHTML = data.percentage + "%"
}


