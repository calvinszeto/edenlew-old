admin.controller 'ProjectsEditCtrl',
  ['$scope', '$routeParams', 'Projects', '$location', 'Images'
    ($scope, $routeParams, Projects, $location, Images) ->
      projectId = $routeParams.projectId
      file = null

      $scope.viewProjects = ->
        $location.path('/projects')

      $scope.uploadImage = ($files) ->
        file = $files[0]

      $scope.selectStartDate = ->
        angular.element('#start-date-picker').click()

      $scope.project = {}
      if projectId?
        Projects.find(projectId).then(
          (project) ->
            $scope.project = project
          )
      else
        Projects.create({}).then(
          (project) ->
            $scope.project = project
            $scope.projectId = project.id
        )
  ]