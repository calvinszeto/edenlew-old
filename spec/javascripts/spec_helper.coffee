beforeEach(module('edenlew'))
beforeEach(module('edenlew-admin'))

beforeEach inject (_$httpBackend_, $rootScope, $controller, $location, $injector, $routeParams, $q, $window,
$templateCache) ->
  @scope = $rootScope.$new()
  @location = $location
  @controller = $controller
  @injector = $injector
  @rootScope = $rootScope
  @routeParams = $routeParams
  @http = _$httpBackend_
  @q = $q
  @window = $window
  @templateCache = $templateCache

beforeEach inject ($rootScope, $compile) ->
  @compileTemplate = (template) ->
    if !template
      return
    $compile(template)(@scope)
    $rootScope.$digest()
