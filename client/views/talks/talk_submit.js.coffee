Template.talkSubmit.events
  'submit form': (e) -> 
    e.preventDefault()

    talk = {
      title:  $(e.target).find('[name=title]').val()
      author: $(e.target).find('[name=author]').val()
      url:    $(e.target).find('[name=url]').val()
      description: $(e.target).find('[name=description]').val()
    }

    Meteor.call 'talk', talk, (error, id) ->
      if error
        # show error to user
        throwError error.reason
        if error.error == 302
          Router.go 'talkPage', {_id: error.details}
      else
        Router.go 'talkPage', {_id: id}

