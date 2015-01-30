app.controller 'ProjectsShowCtrl', [
  '$scope', '$routeParams', '$location', 'Projects', '$sce',
  ($scope, $routeParams, $location, Projects, $sce) ->
    $scope.returnToIndex = ->
      $location.path("/projects")

    Projects.find($routeParams.projectId).then(
      (project) ->
        $scope.project = project
        $scope.projectContent = $sce.trustAsHtml(project.content)
    )
]