Template.talkEdit.events
  'submit form': (e) -> 
    e.preventDefault()

    currentTalkId = this._id

    talkProperties = {
      title:  $(e.target).find('[name=title]').val()
      author: $(e.target).find('[name=author]').val()
      url:    $(e.target).find('[name=url]').val()
      description: $(e.target).find('[name=description]').val()
    }

    Talks.update( currentTalkId, {$set: talkProperties}, (error) ->
      if error
        alert error.reason
      else
        Router.go 'talkPage', {_id: currentTalkId}
    )

  'click .delete': (e) ->
    e.preventDefault()

    if confirm('Delete this talk?')
      currentTalkId = this._id
      Talks.remove currentTalkId
      Router.go 'talksList'
