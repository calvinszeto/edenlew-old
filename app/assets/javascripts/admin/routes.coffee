admin.config ['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when('/',
      redirectTo: 'projects'
    ).when('/projects',
      templateUrl: 'admin/projects_list.html'
      controller: 'ProjectsListCtrl'
    ).when('/projects/new',
      templateUrl: 'admin/projects_edit.html'
      controller: 'ProjectsEditCtrl'
    ).when('/projects/:projectId',
      templateUrl: 'admin/projects_edit.html'
      controller: 'ProjectsEditCtrl'
    )
]
