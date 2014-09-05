Template._errors.helpers
  errors: -> Errors.find()

Template._error.rendered = ->
  error = this.data
  Meteor.defer -> Errors.update(error._id, {$set: {seen: true}})
