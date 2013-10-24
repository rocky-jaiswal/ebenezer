'use strict'

angular.module('ebenezerApp', [
  'ngCookies', 'ngResource', 'ngSanitize',
  'ebenezerApp.webService', 'ebenezerApp.storageService'
])
  .config ($routeProvider) ->
    $routeProvider
      .when('/', {templateUrl: 'views/main.html', controller: 'MainCtrl'})
      .otherwise(redirectTo: '/')
