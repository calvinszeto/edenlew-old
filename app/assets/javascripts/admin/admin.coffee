@admin = angular.module 'edenlew-admin',
  ['templates',
    'ngResource',
    'ngRoute',
    'angularFileUpload']

@admin.config([
  '$httpProvider',
  ($httpProvider) ->
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])
