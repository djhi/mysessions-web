Template['afCheckboxGroup_switches'].helpers
  atts: ->
    atts = _.clone(@atts)
    if @selected
      atts.checked = ''
    # remove data-schema-key attribute because we put it
    # on the entire group
    delete atts['data-schema-key']
    delete atts['switchOptions']
    atts
  dsk: ->
    { 'data-schema-key': @atts['data-schema-key'] }

Template['afCheckboxGroup_switches'].rendered = ->
  @$('input').bootstrapSwitch @data.atts.switchOptions or {}
