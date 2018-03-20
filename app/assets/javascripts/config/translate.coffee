angular.module('TodoApp').config [
  '$translateProvider'
  ($translateProvider) ->
    $translateProvider.translations 'en',
      'APP_NAME': 'Simple ToDo List'
      'SIGN_OUT': 'Sign out'
      'SIGN_UP': 'Sign Up'
      'SIGN_IN': 'Sign In'
      'USERNAME': 'User name'
      'PASSWORD': 'Password'
      'CONFIRM_PASSWORD': 'Confirm password'
      'PROJECTS': 'Projects'
      'CREATE': 'CREATE',
      'ADD_TASK': 'Add Task'
      'UPDATE_TASK': 'Update Task'
      'ADD_COMMENT': 'Add Comment'
      'NO_COMMENT': 'No comment'
    $translateProvider.preferredLanguage 'en'
    $translateProvider.useSanitizeValueStrategy 'escaped'
    return
]