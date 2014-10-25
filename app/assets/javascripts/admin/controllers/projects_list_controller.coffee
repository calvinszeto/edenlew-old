admin.controller 'ProjectsListCtrl',
  ['$scope', 'Projects', '$location', ($scope, Projects, $location) ->
    $scope.projects = []
    Projects.all().then (projects) -> $scope.projects = projects

    $scope.newProject = ->
      $location.path('/projects/new')

    $scope.editProject = (project) ->
      $location.path("/projects/#{project.id}")
  ]
