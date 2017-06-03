Omniauth = ($auth, $state) ->
  service = this
  
  service.call = (provider) ->
    console.log provider
    console.log "dd"
    return unless provider
    $auth.authenticate(provider).then (
      (response) ->
        $state.go 'main'
      )
  
angular.module('TodoApp').service 'Omniauth', ['$auth', '$state', Omniauth]