admin.directive 'zebraDatepicker',
  [->
    restrict: 'E'
    templateUrl: 'admin/directives/zebra-datepicker.html'
    transclude: true
    require: 'ngModel'
    link: (scope, element, attrs, ngModel) ->
      element.find('input.zebra-datepicker-input').Zebra_DatePicker(
        onSelect: (formattedDate, standardDate, jsDate, dateElement) ->
          ngModel.$setViewValue(jsDate)
      )
      element.find('img.zebra-datepicker-icon').on('click',
        ->
          element.find('input.zebra-datepicker-input button').click())
]