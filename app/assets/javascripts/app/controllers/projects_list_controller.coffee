app.controller 'ProjectsListCtrl',
  ['$scope', 'Projects', '$location', '$animate',
    ($scope, Projects, $location, $animate) ->
      $scope.projects = []
      $scope.selectedCategory = null;
      $scope.categories = []

      collectCategories = (projects) ->
        $scope.categories = _.uniq(_.pluck(_.flatten(_.pluck(projects, 'categories')), 'name'))

      $scope.setCategory = (category) ->
        if $scope.selectedCategory == category
          $scope.selectedCategory = null
        else
          $scope.selectedCategory = category

      $scope.categoryComparator = (projectCategories, selectedCategories) ->
        selectedCategory = selectedCategories[0]
        !selectedCategory? || selectedCategory in _.pluck(projectCategories, 'name')

      $scope.showProject = (project) ->
        $animate.addClass('#animation-overlay', 'fade-out').then( ->
          $scope.$apply( ->
            $location.path("/projects/#{project.id}")
          )
        )

      Projects.all().then(
        (projects) ->
          $scope.projects = projects
          collectCategories(projects)
          $animate.removeClass('#animation-overlay', 'fade-out')
      )
  ]