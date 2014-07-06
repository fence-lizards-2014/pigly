// this file is on production

var Vote = {
  init: function() {

    $('a#upvote').on('ajax:success', this.changeVotes)

  },

  changeVotes: function(event, data, status, xhr) {
    event.preventDefault();
    this.parentNode.querySelector('p').innerHTML = data.upvote_count
  }

}




$(document).ready.(function(){
  Vote.init();
})