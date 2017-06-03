UsersController = ($scope, $auth, $state, Omniauth, Flash) ->
  
  ctrl = @
  
  ctrl.create = (form) ->
    $auth.submitRegistration(form).then (
      (response) ->
        $auth.submitLogin({
          email: form.email,
          password: form.password
        })
        $state.go 'main'
      ), (resp) ->
        Flash.create 'warning', resp.data.errors.full_messages
      
  $scope.social = (provider) ->
    $auth.authenticate(provider).then (
      (response) ->
        $state.go 'main'
      ), (response) ->
        Flash.create 'warning', 'Social Auth Error'
        
  $scope.$on 'auth:registration-email-error', (ev, reason) ->
     Flash.create 'warning', reason.errors[0]
     
  return

angular.module('TodoApp').controller 'UsersController', [
  '$scope',
  '$auth',
  '$state',
  'Omniauth',
  'Flash',
  UsersController
]