Router.configure(
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  waitOn: -> Meteor.subscribe 'talks'
)
Router.map -> 
  this.route 'talksList', {path: '/'}

  this.route 'talkPage',  {
    path: '/talks/:_id'
    data: -> Talks.findOne this.params._id
  }

  this.route 'talkEdit', {
    path: '/talks/:_id/edit',
    data: -> Talks.findOne this.params._id
  }

  this.route 'talkSubmit', {
    path: '/submit'
  }

requireLogin = (pause) ->
  if !Meteor.user()
    if Meteor.loggingIn()
      this.render this.loadingTemplate
    else
      this.render 'accessDenied'
    pause()

Router.onBeforeAction 'loading'

Router.onBeforeAction requireLogin, {only: 'talkSubmit'}