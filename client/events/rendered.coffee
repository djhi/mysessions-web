Template._eventsForm.rendered = ->
  @$('[name="typeaheadRecurringEvent"]').typeahead
    highlight: true
    hint: true
    minLength: 0
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
      cursor = MS.RecurringEvents.findByUser Meteor.userId()
      callback cursor.map (item) ->
        label: item.name, value: item._id
      return
  return
