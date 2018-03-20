SessionsController = ($scope, $auth, $state, Flash) ->
  ctrl = @
  ctrl.loginForm = {}
  
  ctrl.create = (form) ->
    $auth.submitLogin({
      username: form.username.$modelValue,
      password: form.password.$modelValue
    })
          
  $scope.$on 'auth:login-success', (ev, user) ->
    $state.go 'main'
    
  $scope.$on 'auth:login-error', (ev, reason) ->
    Flash.create 'warning', reason.errors[0]
    
  return

angular.module('TodoApp').controller 'SessionsController', [
  '$scope',
  '$auth',
  '$state',
  'Flash',
  SessionsController
]