'use strict'

angular.module('codeclassApp').controller 'EditorCtrl', ($scope,$localStorage) ->
  $scope.$storage = $localStorage;

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
      content:'<html><head>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<div class="menu">

<div class="icon-close">
<img src="http://s3.amazonaws.com/codecademy-content/courses/ltp2/img/uber/close.png">
</div>

<ul>
<li><a href="#">About</a></li>
<li><a href="#">Blog</a></li>
<li><a href="#">Help</a></li>
<li><a href="#">Contact</a></li>
</ul>
</div>

<div class="jumbotron">

<div class="icon-menu">
<i class="fa fa-bars"></i>
Menu
</div>
</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</body></html>'
    }
    {
      name:'style.css'
      opts: $scope.aceOptionCss
      content:'body {
  left: 0;
  margin: 0;
  overflow: hidden;
  position: relative;
}

/* Initial menu */
.menu {
  background: #202024 url(\'http://s3.amazonaws.com/codecademy-content/courses/ltp2/img/uber/black-thread.png\') repeat left top;
  left: -285px;  /* start off behind the scenes */
  height: 100%;
  position: fixed;
  width: 285px;
}

/* Basic styling */

.jumbotron {
  background-image: url(\'http://s3.amazonaws.com/codecademy-content/courses/ltp2/img/uber/bg.png\');
  height: 100%;
  -webkit-background-size: cover;
     -moz-background-size: cover;
       -o-background-size: cover;
          background-size: cover;
}

.menu ul {
  border-top: 1px solid #636366;
  list-style: none;
  margin: 0;
  padding: 0;
}

.menu li {
  border-bottom: 1px solid #636366;
  font-family: \'Open Sans\', sans-serif;
  line-height: 45px;
  padding-bottom: 3px;
  padding-left: 20px;
  padding-top: 3px;
}

.menu a {
  color: #fff;
  font-size: 15px;
  text-decoration: none;
  text-transform: uppercase;
}

.icon-close {
  cursor: pointer;
  padding-left: 10px;
  padding-top: 10px;
}

.icon-menu {
  color: #fff;
  cursor: pointer;
  font-family: \'Open Sans\', sans-serif;
  font-size: 16px;
  padding-bottom: 25px;
  padding-left: 25px;
  padding-top: 25px;
  text-decoration: none;
  text-transform: uppercase;
}

.icon-menu i {
  margin-right: 5px;
}'
    }
    {
      name:'app.js'
      opts: $scope.aceOptionJs
      content:'var main = function(){
    $(\'.icon-menu\').click(function(){
        $(\'.menu\').animate({left:\'0px\'},200);
        $(\'body\').animate({
      left: \'300px\'
    }, 200);
        });
    $(\'.icon-close\').click(function() {
    $(\'.menu\').animate({
      left: "-285px"
    }, 200);

    $(\'body\').animate({
      left: "0px"
    }, 200);
  });
};
$(document).ready(main);'
    }
  ]

  if not $scope.$storage.files
    $scope.$storage.files = $scope.files

  $scope.frameContent.htmlCode = $scope.$storage.files[0].content
  $scope.frameContent.cssCode = $scope.$storage.files[1].content
  $scope.frameContent.jsCode = $scope.$storage.files[2].content

