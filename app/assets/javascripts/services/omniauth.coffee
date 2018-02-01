Omniauth = ($auth, $state) ->
  service = this
  
  service.call = (provider) ->
    return unless provider
    $auth.authenticate(provider).then (
      (response) ->
        $state.go 'main'
      )
  
angular.module('TodoApp').service 'Omniauth', ['$auth', '$state', Omniauth]