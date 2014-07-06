// this file is on production

var Vote = {
  init: function() {
    $('a#upvote').on('ajax:success', this.changeVotes)
    $('a#downvote').on('ajax:success', this.changeVotes)
  },

  changeVotes: function(event, data, status, xhr) {
    event.preventDefault();
    debugger
    this.parentNode.querySelector('.vote-holder').innerHTML = data.percentage + "%"
  }
}

$(document).ready(function(){
  Vote.init();
})
