app.controller 'ProjectsListCtrl',
  ['$scope', 'Projects', '$location', ($scope, Projects, $location) ->
    $scope.projects = []
    Projects.all().then (projects) -> $scope.projects = projects
  ]
