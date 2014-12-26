app.config ['$routeProvider', ($routeProvider) ->
  $routeProvider
  .when('/',
    redirectTo: 'projects'
  ).when('/projects',
    templateUrl: 'app/projects_list.html'
    controller: 'ProjectsListCtrl'
  ).when('/projects/:projectId',
    templateUrl: 'app/projects_show.html'
    controller: 'ProjectsShowCtrl'
  )
]
