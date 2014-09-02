Meteor.publish 'talks', ->
  Talks.find() # todo: scope by forum_id

Meteor.publish 'forums', ->
  Forums.find()

console.log "HEHEHEHEHEHE"
console.log Forums.find().fetch() 
