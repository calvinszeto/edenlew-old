describe 'zebraDatepicker Directive', ->
  beforeEach ->
    @scope.project = {
      date: ""
    }
    @element = angular.element("<zebra-datepicker ng-model='project.date'></zebra-datepicker>")
    @compileTemplate(@element)


