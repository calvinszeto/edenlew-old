admin.controller 'ProjectsEditCtrl',
  ['$scope', '$routeParams', 'Projects', '$location', 'Images', 'Categories',
    ($scope, $routeParams, Projects, $location, Images, Categories) ->
      projectId = $routeParams.projectId
      file = null

      $scope.viewProjects = ->
        $location.path('/projects')

      $scope.destroyProject = ->
        Projects.destroy(projectId).then(
          ->
            $scope.viewProjects()
          , ->
            angular.element('.message').addClass('error-message')
            $scope.message = "Project could not be deleted."
        )

      $scope.saveProject = ->
        Projects.update(projectId, $scope.project).then(
          (project) ->
            angular.element('.message').addClass('success-message')
            $scope.message = "Project saved successfully."
          , (project) ->
            angular.element('.message').addClass('error-message')
            $scope.message = "Project could not be saved."
        )

      $scope.uploadImage = ($files) ->
        file = $files[0]

      $scope.toggleVisible = ->
        $scope.project.visible = !$scope.project.visible

      $scope.hasCategory = (category) ->
        _.contains($scope.project.categories, category)

      $scope.addCategory = ->
        Categories.create({name: $scope.newCategory}).then(
          (category) ->
            $scope.categories.push(category.name)
        )

      # Get Project
      $scope.project = {}
      if projectId?
        Projects.find(projectId).then(
          (project) ->
            $scope.project = project
          )
      else
        Projects.create(project: {}).then(
          (project) ->
            $scope.project = project
            $scope.projectId = project.id
            projectId = project.id
        )

      # Get Categories
      $scope.newCategory = ""
      $scope.categories = []
      Categories.all().then(
        (categories) ->
          $scope.categories = categories
      )
      # Get Images
  ]