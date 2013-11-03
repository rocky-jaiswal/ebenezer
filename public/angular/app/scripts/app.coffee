'use strict'

angular.module('ebenezerApp', [
  'ngCookies', 'ngResource', 'ngSanitize',
  'ebenezerApp.webService', 'ebenezerApp.storageService'
])
  .config ($routeProvider) ->
    $routeProvider
      .when('/', {templateUrl: 'views/login.html', controller: 'LoginCtrl'})
      .when('/home', {templateUrl: 'views/main.html', controller: 'MainCtrl'})
      .otherwise(redirectTo: '/')
  .config ($httpProvider) ->
    interceptor = ["$rootScope", "$location", "$q", ($scope, $location, $q) ->
      success = (resp) ->
        resp

      err = (resp) ->
        if resp.status is 401
          d = $q.defer()
          $location.url "login"
          return d.promise
        $q.reject resp

      (promise) ->
        promise.then success, err
    ]
    $httpProvider.responseInterceptors.push interceptor
