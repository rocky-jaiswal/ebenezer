'use strict'

class WebService

  constructor: (@$http, @storageService) ->
    @baseUrl = "/api/v1/"

  login: (user) ->
    @$http.post(@baseUrl + "login", {user: {email: user.email, password: user.password}})

  getAuthHeaders: () ->
    {email: @storageService.get("email"), token: @storageService.get("token")}

  getGreeting: () ->
    @$http.get(@baseUrl + "greet", {headers: @getAuthHeaders()})

  getPosts: () ->
    @$http.get(@baseUrl + "posts", {headers: @getAuthHeaders()})

angular.module "ebenezerApp.webService", [], ($provide) ->
  $provide.factory "webService", ["$http", "storageService", ($http, storageService) -> new WebService($http, storageService)]