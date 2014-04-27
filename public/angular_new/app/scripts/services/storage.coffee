"use strict"

class StorageService

  store: (key, value) ->
    localStorage.setItem(key, value)

  get: (key) ->
    localStorage.getItem key

  deleteItem: (key) ->
    localStorage.removeItem(key)

  logout: ->
    localStorage.removeItem("email")
    localStorage.removeItem("token")

storageService = angular.module "ebenezerApp.storageService", []
storageService.factory "storageService", -> new StorageService()