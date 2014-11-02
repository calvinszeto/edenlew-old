admin.controller 'ProjectsEditCtrl',
  ['$scope', '$routeParams', 'Projects', '$location', 'Images', 'Categories',
    ($scope, $routeParams, Projects, $location, Images, Categories) ->
      projectId = $routeParams.projectId
      file = null

      $scope.viewProjects = ->
        $location.path('/projects')

      $scope.uploadImage = ($files) ->
        file = $files[0]

      $scope.toggleVisible = ->
        $scope.project.visible = !$scope.project.visible

      # Get Project
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

      # Get Categories
      Categories.all().then(
        (categories) ->
          $scope.categories = categories
      )
      # Get Images
  ]