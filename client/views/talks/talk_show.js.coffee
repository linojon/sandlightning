Template.talkShow.helpers
  forum: -> 
    console.log this.forumId
    Forums.findOne( this.forumId )