'use strict'

class WebService

  constructor: (@$http, @storageService) ->
    @baseUrl = "/api/v1/"

  getGreeting: () ->
    @$http.get(@baseUrl + "greet", {headers: @getAuthHeaders()})

  login: (user) ->
    @$http.post(@baseUrl + "login", {user: {email: user.email, password: user.password}})    

  getAuthHeaders: () ->
    {email: @storageService.get("email"), token: @storageService.get("token")}

angular.module "ebenezerApp.webService", [], ($provide) ->
  $provide.factory "webService", ["$http", "storageService", ($http, storageService) -> new WebService($http, storageService)]