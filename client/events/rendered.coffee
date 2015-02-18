Template._eventsForm.rendered = ->
  @$('[name="typeaheadRecurringEvent"]').typeahead
    highlight: true
    hint: true
    minLength: 1
  ,
    name: 'recurringEvents'
    displayKey: 'label'
    templates:
      suggestion: (item) ->
        item.label
      footer: ->
        text = TAPi18n.__ 'select-or-create-category-help'
        "<p class=\"tt-empty\">#{text}</p>"
    source: (query, callback) ->
      cursor = MS.RecurringEvents.findByName query, Meteor.userId()
      callback cursor.map (item) ->
        label: item.name, value: item._id
      return
  return

Template._newParticipantTypeahead.rendered = ->
  @$('[name="newParticipant"]').typeahead
    highlight: true
    hint: true
    minLength: 1
  ,
    name: 'participants'
    displayKey: 'label'
    templates:
      suggestion: (item) ->
        "#{item.label} - #{item.obj.recurringEvents}"
      footer: ->
        text = TAPi18n.__ 'select-or-create-participant-help'
        "<p class=\"tt-empty\">#{text}</p>"
    source: (query, callback) ->
      Meteor.call 'findParticipants', query, (error, result) ->
        # TODO: display error
        if error
          console.log error

        callback _.map result, (item) ->
          label: item.name, value: item._id, obj: item
        return
      return
  return
