app.controller 'ProjectsShowCtrl', [
  '$scope', '$routeParams', 'Projects'
  ($scope, $routeParams, Projects) ->
    Projects.find($routeParams.projectId).then(
      (project) -> $scope.project = project; console.log(project)
    )
]