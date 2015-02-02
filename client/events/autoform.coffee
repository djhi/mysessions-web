AutoForm.addHooks 'eventForm',
  onSuccess: ->
    Router.go 'events'
