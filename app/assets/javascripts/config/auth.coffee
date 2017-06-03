angular.module('TodoApp').config ($authProvider) ->
  $authProvider.configure
   # validateOnPageLoad: false
    omniauthWindowType: 'newWindow'
    authProviderPaths:
      facebook: '/auth/facebook'
      github:   '/auth/github'