'use strict'

class MainCtrl

  constructor: (@$scope, @webService, @storageService) ->
    @setup()

  setup: ->
    @getData()

  getData: ->
    promise = @webService.getGreeting()
    promise.then @success, @error

    anotherPromise = @webService.getPosts()
    anotherPromise.then @setPosts, @error

  success: (response) =>
    @$scope.message = response.data.message

  setPosts: (response) =>
    @$scope.posts = response.data

  error: (response) =>
    @$scope.message = "Error while retrieving data from server!"


MainCtrl.$inject = ["$scope", "webService", "storageService"]
angular.module("ebenezerApp").controller "MainCtrl", MainCtrl