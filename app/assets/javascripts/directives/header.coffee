app.directive 'header',
  () ->
    restrict: 'E'
    templateUrl: "directives/header.html"
    link: ->
      console.log "hello"
