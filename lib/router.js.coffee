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

Router.onBeforeAction 'loading'