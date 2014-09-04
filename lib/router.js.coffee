Router.configure(
  layoutTemplate: 'application'
  loadingTemplate: 'loading'
  waitOn: -> 
    [
      Meteor.subscribe('talks'), # todo: for forumId
      Meteor.subscribe('comments') # todo: add commentsCount attribute to talk
    ]
)

Router.map -> 
  this.route 'talksList', {path: '/talks'}

  this.route 'talkShow',  {
    path: '/talks/:_id'
    data: -> Talks.findOne this.params._id
    waitOn: ->
      # Meteor.subscribe 'singleTalk', this.params._id
      # Meteor.subscribe 'talks'
      # Meteor.subscribe 'singleForum', 
      # Meteor.subscribe('forums')
      [
        Meteor.subscribe('forums'),
        Meteor.subscribe('comments', {talkId: this.params_id})
      ]
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

# scroll to top of page hack https://github.com/tmeasday/meteor-router/issues/71
Router._filters = {
  resetScroll: ->
    scrollTo = window.currentScroll || 0
    $('body').scrollTop(scrollTo)
    $('body').css("min-height", 0)
}
filters = Router._filters

if Meteor.isClient
  Router.onAfterAction filters.resetScroll # for all pages

