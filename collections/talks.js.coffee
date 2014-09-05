@Talks = new Meteor.Collection('talks')

# Talks.allow(
#   insert: (userId, doc) ->
#     # only allow create if logged in
#     !! userId
# )

Talks.allow
  update: ownsDocument
  remove: ownsDocument

Talks.deny
  update: (userId, talk, fieldNames) ->
    # may only edit these fields
    _.without(fieldNames, 'url', 'title', 'author', 'description').length > 0
  

Meteor.methods(
  talk: (talkAttributes) ->
    user = Meteor.user()
    talkWithSameLink = Talks.findOne( url: talkAttributes.url )

    # require log in
    if !user
      throw new Meteor.Error(401, "You need to login to post new talks")

    # validate presence of title
    if !talkAttributes.title
      throw new Meteor.Error(422, "Please fill in a title")

    # validate unique link
    if talkAttributes.url && talkWithSameLink
      throw new Meteor.Error(302, "This link has already been posted", talkWithSameLink._id)

    # pick out the whitelisted keys
    talk = _.extend(_.pick(talkAttributes, 'url', 'title', 'author', 'description'), 
      userId: user._id
      # author: user.username
      submittedAt: new Date().getTime()
      commentsCount: 0
    )

    talkId = Talks.insert talk
)