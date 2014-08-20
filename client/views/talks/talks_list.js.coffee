Template.talksList.helpers
  talks: ->
    Talks.find {}, {sort: {submitted: -1}}
