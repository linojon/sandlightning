@Comments = new Meteor.Collection 'comments'

Meteor.methods(
  comment: (attrs) ->
    user = Meteor.user()
    talk = Talks.findOne( attrs.talkId )

    if !user
      throw new Meteor.Error(401, "You need to login to make comments")

    if !attrs.body
      throw new Meteor.Error(422, "Please write some content")

    if !talk
      throw new Meteor.Error(422, "You must comment on a talk")

    comment = _.extend(_.pick(attrs, 'talkId', 'body'), {
      userId: user._id
      author: user.username
      submittedAt: new Date().getTime()
    })

    Talks.update comment.talkId, {$inc: {commentsCount: 1}}

    Comments.insert comment
)

