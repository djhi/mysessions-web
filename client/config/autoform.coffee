AutoForm.addHooks null,
  beginSubmit: (formId, template) ->
    template.$('[type=submit]').button 'loading'
    return

  endSubmit: (formId, template) ->
    template.$('[type=submit]').button 'reset'
    return

  onSuccess: (operation, error, template) ->
    $.growl 'Données sauvegardées', type: 'success'
    return

  onError: (operation, error, template) ->
    $.growl 'Une erreur est survenue', type: 'danger'
    return
