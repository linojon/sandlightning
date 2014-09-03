Meteor.publish 'forums', ->
  Forums.find()

# Meteor.publish 'singleForum', (id) ->
#   id && Forums.findOne(id)

Meteor.publish 'talks', (forumId) ->
  Talks.find() # {forumId: forumId}, {sort: {position: 1}})


# Meteor.publish 'singleTalk', (id) ->
#   id && Talks.findOne(id) 
