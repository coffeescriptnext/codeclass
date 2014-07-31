'use strict'

angular.module('codeclassApp').controller 'EditorCtrl', ($scope) ->
  $scope.message = 'Hello'
  $scope.content = ''
  $scope.modes = ['Scheme', 'XML', 'Javascript']
  $scope.mode = $scope.modes[0]

  $scope.frameContent = {}

  # The ui-ace option
  $scope.aceOptionHtml =
    onChange: (event)->
      $scope.frameContent.htmlCode = event[1].getValue()
    mode: 'html'

  $scope.aceOptionCss =
    onChange: (event)->
      $scope.frameContent.cssCode = event[1].getValue()
    mode: 'css'

  $scope.aceOptionJs =
    onChange: (event)->
      $scope.frameContent.jsCode = event[1].getValue()
    mode: 'javascript'

  $scope.files = [
    {
      name:'index.html'
      opts: $scope.aceOptionHtml
    }
    {
      name:'style.css'
      opts: $scope.aceOptionCss
    }
    {
      name:'app.js'
      opts: $scope.aceOptionJs
    }
  ]
