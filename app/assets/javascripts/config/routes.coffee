angular.module('TodoApp').config ['$stateProvider', '$urlRouterProvider', '$locationProvider', '$logProvider', ($stateProvider, $urlRouterProvider, $locationProvider, $logProvider) ->
  $stateProvider
  .state 'main',
    url: '/'
    controller: 'ProjectsController'
    controllerAs: 'projects'
    templateUrl: 'projects/index.html'
    resolve: auth: to_sign_in

  .state 'sign_in',
    url: '/sign_in'
    controller: 'SessionsController'
    controllerAs: 'sessions'
    templateUrl: 'sessions/new.html'
    resolve: auth: to_main
    
  .state 'sign_up',
    url: '/sign_up'
    controller: 'UsersController'
    controllerAs: 'users'
    templateUrl: 'users/new.html'
    resolve: auth: to_main
    
  $logProvider.debugEnabled(true)
  $locationProvider.html5Mode(true)
  $urlRouterProvider.otherwise '/'
]

to_sign_in = ($auth, $state, $translate) ->
  $auth.validateUser().catch (res) ->
    $state.go 'sign_in'

to_main = ($auth, $state, $location) ->
  $auth.validateUser()
    .then(() ->
      $state.go 'main'
    )
    .catch(() ->
      return
    )

angular.module('TodoApp').run ($rootScope, $state, $auth) ->
  $rootScope.$on 'auth:logout-success', (ev) ->
    $state.go 'sign_in'