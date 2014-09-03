Template.talksList.helpers
  talks: ->
    Talks.find {}, {sort: {position: 1}}
