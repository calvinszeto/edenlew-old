describe 'zebraDatepicker Directive', ->
  beforeEach ->
    @element = angular.element("<zebra-datepicker ng-model='project.date'></zebra-datepicker>")
    @compileTemplate(@element)

  it "should pass", ->
    expect(@scope.hello).toEqual("goodbye")
