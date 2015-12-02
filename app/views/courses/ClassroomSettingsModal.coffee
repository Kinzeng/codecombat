Classroom = require 'models/Classroom'
ModalView = require 'views/core/ModalView'
template = require 'templates/courses/classroom-settings-modal'

module.exports = class AddLevelSystemModal extends ModalView
  id: 'classroom-settings-modal'
  template: template

  events:
    'click #save-settings-btn': 'onClickSaveSettingsButton'

  initialize: (options) ->
    @classroom = options.classroom

  onClickSaveSettingsButton: ->
    name = $('.settings-name-input').val()
    unless @classroom
      return unless name
      @classroom = new Classroom({ name: name })
    if name
      @classroom.set('name', name)
    description = $('.settings-description-input').val()
    @classroom.set('description', description)
    @classroom.set('aceConfig', {
      language: @$('#programming-language-select').val()
    })
    @classroom.save()
    @hide()