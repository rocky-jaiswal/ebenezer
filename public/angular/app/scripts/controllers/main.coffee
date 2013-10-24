'use strict'

class MainCtrl

  constructor: (@$scope, @webService, @storageService) ->
    @setup()

  setup: ->
    @$scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
    @getData()

  getData: ->
    promise = @webService.getGreeting()
    promise.then @success, @error

  success: (response) =>
    @$scope.message = response.data.message

  error: (response) =>
    @$scope.message = "Error!"


MainCtrl.$inject = ["$scope", "webService", "storageService"]
angular.module("ebenezerApp").controller "MainCtrl", MainCtrl