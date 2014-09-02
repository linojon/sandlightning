Meteor.publish 'forums', ->
  Forums.find()

Meteor.publish 'singleForum', (id) ->
  id && Forums.find(id)

Meteor.publish 'talks', (forumId) ->
  Talks.find(forumId: forumId)

Meteor.publish 'singleTalk', (id) ->
  id && Talks.find(id) 
