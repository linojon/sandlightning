Router.configure(
  layoutTemplate: 'application'
  loadingTemplate: 'loading'
  # waitOn: -> Meteor.subscribe ['forums', 'talks']
)
Router.map -> 
  # this.route 'talksList', {path: '/'}

  # this.route 'talkPage',  {
  #   path: '/talks/:_id'
  #   data: -> Talks.findOne this.params._id
  # }

  # this.route 'talkEdit', {
  #   path: '/talks/:_id/edit',
  #   data: -> Talks.findOne this.params._id
  # }

  # this.route 'talkSubmit', {
  #   path: '/submit'
  # }

  #####
  this.route 'home', {
    layoutTemplate: 'page'
    path: '/'
  }

  this.route 'about', {
    layoutTemplate: 'page'
    path: '/about'
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

Router.onBeforeAction -> clearErrors()