UsersController = ($scope, $auth, $state, Flash) ->
  ctrl = @
  ctrl.registrationForm = {}
  
  ctrl.create = (form) ->
    if form.$valid
      $auth.submitRegistration({
        username: form.username.$modelValue,
        password: form.password.$modelValue,
        password_confirmation: form.password_confirmation.$modelValue
      }).then ( (response) ->
        Flash.create 'success', "<b>Well done!</b> You’re successfully registered!"
        $auth.submitLogin({
          username: form.username.$modelValue,
          password: form.password.$modelValue
        })
        $state.go 'main'
      ), (resp) ->
        Flash.create 'warning', resp.data.errors.full_messages
        
  $scope.$on 'auth:registration-email-error', (ev, reason) ->
    Flash.create 'warning', reason.errors[0]
     
  return

angular.module('TodoApp').controller 'UsersController', [
  '$scope',
  '$auth',
  '$state',
  'Flash',
  UsersController
]