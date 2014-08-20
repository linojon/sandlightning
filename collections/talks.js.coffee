@Talks = new Meteor.Collection('talks')

# Talks.allow(
#   insert: (userId, doc) ->
#     # only allow create if logged in
#     !! userId
# )

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
      submitted: new Date().getTime()
    )

    talkId = Talks.insert talk
)