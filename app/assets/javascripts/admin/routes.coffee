admin.config ($routeProvider) ->
  $routeProvider
    .when('/',
      templateUrl: 'admin/projects_list.html'
      controller: 'ProjectsCtrl'
    )