app.controller 'ProjectsListCtrl',
  ['$scope', 'Projects', '$location', '$animate',
    ($scope, Projects, $location, $animate) ->
      $scope.projects = []
      $scope.selectedCategories = [];
      $scope.categories = []

      collectCategories = (projects) ->
        $scope.categories = _.uniq(_.pluck(_.flatten(_.pluck(projects, 'categories')), 'name'))

      $scope.isSelected = (category) ->
        category in $scope.selectedCategories

      $scope.setCategory = (category) ->
        if $scope.isSelected(category)
          $scope.selectedCategories = _.reject($scope.selectedCategories, (cat) -> cat == category)
        else
          $scope.selectedCategories.push(category)

      $scope.categoryComparator = (projectCategories, selectedCategories) ->
        _.every(selectedCategories, (category) -> category in _.pluck(projectCategories, 'name'))

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