admin.controller 'ProjectsCtrl',
  ['$scope', 'Projects', ($scope, Projects) ->
    $scope.projects = []
    Projects.all().then (projects) -> $scope.projects = projects
  ]
