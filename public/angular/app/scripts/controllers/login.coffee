'use strict'

class LoginCtrl

  constructor: (@$scope, @$location, @webService, @storageService) ->
    @setup()

  setup: ->
    @$scope.login = @login

  login: (user) =>
    promise = @webService.login(user)
    promise.then @success, @error

  success: (response) =>
    @storageService.store "email", response.data.email
    @storageService.store "token", response.data.token
    @$location.url "home"
   
  error: (response) =>
    console.log response

LoginCtrl.$inject = ["$scope", "$location", "webService", "storageService"]
angular.module("ebenezerApp").controller "LoginCtrl", LoginCtrl