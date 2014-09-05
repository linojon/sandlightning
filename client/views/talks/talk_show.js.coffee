Template.talkShow.helpers
  forum: -> 
    # console.log this.forumId
    Forums.findOne( this.forumId )

  nextTalk: ->
    if this.position < Talks.find( forumId: this.forumId ).count()
      Talks.findOne( position: this.position+1 )
      
  prevTalk: ->
    if this.position > 0
      Talks.findOne( position: this.position-1 )

  comments: ->
    Comments.find( talkId: this._id, {sort: {submittedAt: -1}} )