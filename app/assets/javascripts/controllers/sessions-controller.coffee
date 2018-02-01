SessionsController = ($scope, $auth, $state, Omniauth, Flash) ->
  ctrl = @
  
  ctrl.create = (form) ->
    $auth.submitLogin(form)
    
  $scope.social = (provider) ->
    $auth.authenticate(provider).then (
      (response) ->
        $state.go 'main'
      ), (response) ->
        Flash.create 'warning', 'Social Auth Error'
        
  $scope.$on 'auth:login-success', (ev, user) ->
    $state.go 'main'
    
  $scope.$on 'auth:login-error', (ev, reason) ->
    Flash.create 'warning', reason.errors[0]
    
  return

angular.module('TodoApp').controller 'SessionsController', [
  '$scope',
  '$auth',
  '$state',
  'Omniauth',
  'Flash',
  SessionsController
]