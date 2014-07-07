// This contains Vote and an on ready.  I think those would belong in a vote.js
// and initializer.js, respectively.  Methinks you've got a hacky file here.
//
// this file is on production

var Vote = {
  init: function() {
    $('a#upvote').on('ajax:success', this.changeVotes)
    $('a#downvote').on('ajax:success', this.changeVotes)
  },

  changeVotes: function(event, data, status, xhr) {
    event.preventDefault();
    this.parentNode.querySelector('.vote-holder').innerHTML = data.percentage + "%"
  }
}

$(document).ready(function(){
  Vote.init();
})
