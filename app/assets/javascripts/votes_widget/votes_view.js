VotesWidget.View = function() {
  this.targetPercentageTag = '.vote-holder'
}

VotesWidget.View.prototype.changeVotes = function(data, clickedObject) {
  var target = this.targetPercentageTag;
  clickedObject.parentNode.querySelector(target).innerHTML = data.percentage + "%"
  this.changeClass(clickedObject, data.class_adjust)
}

VotesWidget.View.prototype.changeClass = function(clickedObject, classAdjust) {
	switch(classAdjust) {
    case "new":
      clickedObject.classList.add('ss-symbolicons-block')
      break;
    case "destroy":
      clickedObject.classList.remove('ss-symbolicons-block')
      break;
    case "switch":
    	clickedObject.parentNode.querySelector('.ss-symbolicons-block').classList.remove('ss-symbolicons-block')
      clickedObject.classList.add('ss-symbolicons-block')
      break;
    default:
      console.log("We should never see this")
	}
}