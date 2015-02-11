###
* Template helpers for "materialize" template
###
Template['quickForm_materialize'].helpers
  submitButtonAtts: ->
    qfAtts = @atts
    atts = {}
    if typeof qfAtts.buttonClasses == 'string'
      atts['class'] = qfAtts.buttonClasses
    else
      atts['class'] = 'btn waves-effect waves-light'
    atts

Template['afFormGroup_materialize'].helpers
  skipLabel: ->
    self = this
    skipLabelTypes = [
      'checkbox'
      'checkbox-group'
      'boolean-checkbox'
      'select-radio'
      'select-radio-group'
      'select-radio-group-inline'
      'boolean-radio'
      'boolean-radio-group'
      'select'
      'boolean-select'
      'select-multiple'
      'toggle'
    ]
    type = AutoForm.getInputType(self.afFieldInputAtts)
    self.skipLabel or _.contains(skipLabelTypes, type)
  materializeFieldLabelAtts: ->
    atts = _.clone(@afFieldLabelAtts)
    classes = [
      'item'
      'item-input'
    ]
    if atts.type == 'placeholder'
      atts.placeholderOnly = true
    else if atts.type == 'stacked'
      classes.push 'item-stacked-label'
    else if atts.type == 'floating'
      classes.push 'item-floating-label'
    atts = AutoForm.Utility.addClass(atts, classes.join(' '))
    atts

_.each [
  'afSelect_materialize'
  'afBooleanSelect_materialize'
  'afSelectMultiple_materialize'
  'afTextarea_materialize'
  'afInputText_materialize'
  'afInputPassword_materialize'
  'afInputDateTime_materialize'
  'afInputDateTimeLocal_materialize'
  'afInputDate_materialize'
  'afInputMonth_materialize'
  'afInputTime_materialize'
  'afInputWeek_materialize'
  'afInputNumber_materialize'
  'afInputEmail_materialize'
  'afInputUrl_materialize'
  'afInputSearch_materialize'
  'afInputTel_materialize'
  'afInputColor_materialize'
], (tmplName) ->
  Template[tmplName].helpers atts: ->
    atts = _.clone(@atts)
    atts
  return

_.each [
  'afInputButton_materialize'
  'afInputSubmit_materialize'
  'afInputReset_materialize'
], (tmplName) ->
  Template[tmplName].helpers atts: ->
    atts = _.clone(@atts)
    # Add bootstrap class
    atts = AutoForm.Utility.addClass(atts, 'button')
    atts
  return

Template['afRadio_materialize'].helpers atts: ->
  atts = _.clone(@atts)
  if @selected
    atts.checked = ''
  atts
_.each [
  'afCheckboxGroup_materialize'
  'afRadioGroup_materialize'
  'afCheckboxGroupInline_materialize'
  'afRadioGroupInline_materialize'
], (tmplName) ->
  Template[tmplName].helpers
    atts: ->
      atts = _.clone(@atts)
      if @selected
        atts.checked = ''
      # remove data-schema-key attribute because we put it
      # on the entire group
      delete atts['data-schema-key']
      atts
    dsk: ->
      { 'data-schema-key': @atts['data-schema-key'] }
  return

selectHelpers = optionAtts: ->
  item = this
  atts = value: item.value
  if item.selected
    atts.selected = ''
  atts

Template['afSelect_materialize'].helpers selectHelpers
Template['afSelectMultiple_materialize'].helpers selectHelpers
Template['afBooleanSelect_materialize'].helpers selectHelpers

Template['afBooleanRadioGroup_materialize'].helpers
  falseAtts: ->
    atts = _.omit(@atts, 'trueLabel', 'falseLabel', 'data-schema-key')
    if @value == false
      atts.checked = ''
    atts
  trueAtts: ->
    atts = _.omit(@atts, 'trueLabel', 'falseLabel', 'data-schema-key')
    if @value == true
      atts.checked = ''
    atts
  dsk: ->
    { 'data-schema-key': @atts['data-schema-key'] }

# Custom Ionic input types:
AutoForm.addInputType 'toggle',
  template: 'afToggle'
  valueOut: ->
    ! !@is(':checked')
  valueConverters:
    'boolean': (val) ->
      if val == 'true'
        return true
      else if val == 'false'
        return false
      val
    'string': (val) ->
      if val == true
        return 'TRUE'
      else if val == false
        return 'FALSE'
      val
    'stringArray': (val) ->
      if val == true
        return [ 'TRUE' ]
      else if val == false
        return [ 'FALSE' ]
      val
    'number': (val) ->
      if val == true
        return 1
      else if val == false
        return 0
      val
    'numberArray': (val) ->
      if val == true
        return [ 1 ]
      else if val == false
        return [ 0 ]
      val
  contextAdjust: (context) ->
    if context.value == true
      context.atts.checked = ''
    #don't add required attribute to checkboxes because some browsers assume that to mean that it must be checked, which is not what we mean by "required"
    delete context.atts.required
    context
# Floating Labels: http://materializeframework.com/docs/components/#forms-floating-labels
# 'label-type': 'floating'

AutoForm.addInputType 'pickadate',
  template: 'afPickadate'
  valueIn: (val) ->
    formattedDate = moment(val).format "yyyy/mm/dd"
    return formattedDate
  valueOut: ->
    item = this.pickadate('picker').get('select')
    if item then result = item.obj
    result

Template.afFormGroup_materialize.rendered = ->
  template = this
  isFloating = template.$('.item-floating-label').length
  if isFloating
    template.$('input').on 'keyup.item-floating-label', (event) ->
      if $(this).val() != ''
        template.$('.item-floating-label .input-label').addClass 'has-input'
      else
        template.$('.item-floating-label .input-label').removeClass 'has-input'
      return
    template.$('input').trigger 'keydown.item-floating-label'
  return

Template.afFormGroup_materialize.destroyed = ->
  template = this
  template.$('input').off 'keyup.item-floating-label'
  return

Template['afPickadate'].rendered = ->
  @$('input').pickadate
    formatSubmit: 'yyyy/mm/dd',
    hiddenName: true
    closeOnSelect: true

  if @data.value
    @$('input').parent().find('label').addClass 'active'
  return

# ---
# generated by js2coffee 2.0.1
