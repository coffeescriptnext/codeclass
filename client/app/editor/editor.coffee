'use strict'

angular.module('codeclassApp').config ($stateProvider) ->
  $stateProvider.state 'editor',
    url: '/editor'
    templateUrl: 'app/editor/editor.html'
    controller: 'EditorCtrl'
