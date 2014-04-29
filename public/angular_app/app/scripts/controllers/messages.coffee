'use strict'

class MessagesCtrl

  constructor: (@$scope, @$location, @webService, @storageService) ->
    @setup()

  setup: ->
    @$scope.$on("notify", @handleNotification)

  handleNotification: (event, args) => 
    @$scope.message = args.message

MessagesCtrl.$inject = ["$scope", "$location", "webService", "storageService"]
angular.module("ebenezerApp").controller "MessagesCtrl", MessagesCtrl