app.controller 'ProjectsShowCtrl', [
  '$scope', '$routeParams', '$location', 'Projects',
  ($scope, $routeParams, $location, Projects) ->
    $scope.returnToIndex = ->
      $location.path("/projects")

    Projects.find($routeParams.projectId).then(
      (project) -> $scope.project = project
    )
]