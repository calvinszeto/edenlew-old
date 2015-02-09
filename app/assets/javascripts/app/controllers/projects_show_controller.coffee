app.controller 'ProjectsShowCtrl', [
  '$scope', '$routeParams', '$location', 'Projects', '$sce', '$animate', '$window',
  ($scope, $routeParams, $location, Projects, $sce, $animate, $window) ->
    $scope.returnToIndex = ->
      $animate.addClass('#animation-overlay', 'fade-out').then( ->
        $scope.$apply( ->
          $location.path("/projects")
        )
      )

    $scope.$on('$viewContentLoaded', (event) ->
      $window.ga('send', 'pageview', {page: $location.url()})
    )

    Projects.find($routeParams.projectId).then(
      (project) ->
        $scope.project = project
        $scope.projectContent = $sce.trustAsHtml(project.content)
        $animate.removeClass('#animation-overlay', 'fade-out')
    )
]