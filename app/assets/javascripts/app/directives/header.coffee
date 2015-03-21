app.directive 'header',
  ->
    restrict: 'E'
    templateUrl: "app/directives/header.html"
    controller: [
      '$scope',
      '$animate',
      '$location',
      ($scope, $animate, $location) ->
        $scope.goToList = ->
          if $location.path() != '/projects'
            $animate.addClass('#animation-overlay', 'fade-out').then( ->
              $scope.$apply( ->
                $location.path("/projects")
              )
            )

        $scope.aboutMe = ->
          if $location.path() != '/about_me'
            $animate.addClass('#animation-overlay', 'fade-out').then( ->
              $scope.$apply( ->
                $location.path("/about_me")
              )
            )
    ]
