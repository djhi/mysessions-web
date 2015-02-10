AutoForm.addHooks null,
  beginSubmit: (formId, template) ->
    template.$('[type=submit]').button 'loading'
    return

  endSubmit: (formId, template) ->
    template.$('[type=submit]').button 'reset'
    return

  onSuccess: (operation, error, template) ->
    $.snackbar content:'Données sauvegardées'
    return

  onError: (operation, error, template) ->
    if !error.invalidKeys
      $.snackbar content:'Une erreur est survenue', timeout: 0
    console.log "Operation: #{operation}. #{error}"
    return
