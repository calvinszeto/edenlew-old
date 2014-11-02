admin.directive 'zebraDatepicker',
  [->
    restrict: 'E'
    templateUrl: 'admin/directives/zebra-datepicker.html'
    transclude: true
    require: 'ngModel'
    link: (scope, element, attrs, ngModel) ->
      scope.hello = "goodbye"
]