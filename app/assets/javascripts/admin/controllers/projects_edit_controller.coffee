admin.controller 'ProjectsEditCtrl',
  ['$scope', '$routeParams', 'Projects', '$location',
   ($scope, $routeParams, Projects, $location) ->
     $scope.viewProjects = ->
       $location.path('/projects')

     $scope.project = {}
     if $routeParams.projectId?
       Projects.find($routeParams.projectId).then(
         (project) ->
           $scope.project = project
         )
  ]