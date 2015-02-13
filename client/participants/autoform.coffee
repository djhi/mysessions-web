AutoForm.addHooks 'participantForm',
  onSuccess: ->
    Router.go 'participants'
