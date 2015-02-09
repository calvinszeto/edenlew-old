@app = angular.module 'edenlew',
    ['templates',
     'ngRoute',
     'ngResource',
     'ngAnimate']

@app.run( [ '$rootScope', '$location', ($rootScope, $location) ->
  $rootScope.$on('$routeChangeSuccess', ->
    ga('send', 'pageview', $location.path())
  )
])