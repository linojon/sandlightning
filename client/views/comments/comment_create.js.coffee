Template.commentCreate.events(
  'submit form': (e, template) ->
    e.preventDefault()

    $body = $(e.target).find('[name=body]')
    comment = {
      body: $body.val()
      talkId: template.data._id
    }

    Meteor.call 'comment', comment, (error, commentId) ->
      if error
        throwError(error.reason)
      else
        $body.val('')
)