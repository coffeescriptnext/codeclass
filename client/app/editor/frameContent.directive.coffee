'use strict'
angular.module('codeclassApp').directive 'frameContent', () ->
  scope: {frameContent:'='}
  restrict: 'A'

  link: ($scope, $element, $attrs) ->
    $scope.$watch 'frameContent',(newValue)->
      if newValue
        doc = $element[0].contentWindow.document
        html = document.createElement( 'html' );
        $html = $(html)
        if newValue.htmlCode
          html.innerHTML = newValue.htmlCode
        if newValue.cssCode
          $html.find('#appendedCss').remove()
          $html.find('head').append($('<style id="appendedCss" type="text/css"></style>').text(newValue.cssCode))
        if newValue.jsCode
          $html.find('#appendedJs').remove()
          $html.find('body').append('<script id="appendedJs">' + newValue.jsCode + '</script>')

        console.log html.innerHTML

        doc.open()
        doc.write($html.html())
        doc.close()
    , true
