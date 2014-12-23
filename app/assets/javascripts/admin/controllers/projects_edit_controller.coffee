admin.controller 'ProjectsEditCtrl',
  ['$scope', '$routeParams', 'Projects', '$location', 'Images', 'Categories', '$upload'
    ($scope, $routeParams, Projects, $location, Images, Categories, $upload) ->
      projectId = $routeParams.projectId

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

      $scope.uploadImages = ($files) ->
        for file in $files
          Images.upload(projectId, file).success(
            (image) ->
              $scope.project.images.push(image)
          )

      $scope.saveImage = (image) ->
        Images.update(projectId, image)

      $scope.deleteImage = (image) ->
        Images.destroy(projectId, image).then(
          ->
            $scope.project.images = _.reject($scope.project.images, (img) -> img == image)
        )

      $scope.setPrimary = (image) ->
        # If any other images are primary, set them to false
        # This doesn't affect the database - the backend will do the same thing separately
        for img in _.filter($scope.project.images, (img )-> img != image && image.primary_icon)
          img.primary_icon = false

      $scope.toggleVisible = ->
        $scope.project.visible = !$scope.project.visible

      $scope.hasCategory = (category) ->
        _.contains($scope.project.categories, category)

      $scope.updateCategory = (category) ->
        if _.contains($scope.project.categories, category)
          $scope.project.categories = _.without($scope.project.categories, category)
        else
          $scope.project.categories.push(category)

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
  ]