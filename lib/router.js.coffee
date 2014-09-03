Router.configure(
  layoutTemplate: 'application'
  loadingTemplate: 'loading'
  waitOn: -> 
    Meteor.subscribe 'talks'
)
Router.map -> 
  this.route 'talksList', {path: '/talks'}

  this.route 'talkShow',  {
    path: '/talks/:_id'
    data: -> Talks.findOne this.params._id
    waitOn: ->
      # Meteor.subscribe 'singleTalk', this.params._id
      # Meteor.subscribe 'talks'
  }

  # this.route 'talkEdit', {
  #   path: '/talks/:_id/edit',
  #   data: -> Talks.findOne this.params._id
  # }

  # this.route 'talkSubmit', {
  #   path: '/submit'
  # }

  #####
  this.route 'homePage', {
    layoutTemplate: 'pages'
    path: '/'
    waitOn: ->  
      Meteor.subscribe 'forums'
  }

  this.route 'aboutPage', {
    layoutTemplate: 'pages'
    path: '/about'
  }

  this.route 'forumsList', {
    path: '/forums'
    waitOn: ->  
      Meteor.subscribe 'forums'
  }

  this.route 'forumShow', {
    path: '/forums/:_id'
    data: -> 
      Forums.findOne this.params._id
    waitOn: -> 
      Meteor.subscribe 'forums'
      Meteor.subscribe 'talks', this.params._id
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