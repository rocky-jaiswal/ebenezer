'use strict'

ebenezerApp = angular.module('ebenezerApp', [
  'ngResource', 'ngSanitize',
  'ngRoute', 'ebenezerApp.storageService', 'ebenezerApp.webService'
])

ebenezerApp.config(
  ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when('/', {templateUrl: 'views/login.html', controller: 'LoginCtrl'})
      .when('/home', {templateUrl: 'views/main.html', controller: 'MainCtrl'})
      .otherwise(redirectTo: '/')
  ]
)
