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
        return alert error.reason
        
    Router.go 'talksList'

