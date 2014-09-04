Template.talkItem.helpers
  ownPost: -> this.userId == Meteor.userId()

  commentsCount: -> 
    # console.log this._id
    Comments.find( talkId: this._id ).count()

  commentsPresent: ->
    # this.commentsCount > 0
    Comments.find( talkId: this._id ).count() > 0