angular.module('TodoApp').config [
  '$translateProvider'
  ($translateProvider) ->
    $translateProvider.translations 'en',
      'APP_NAME': 'Todo App'
      'SIGN_OUT': 'Sign out'
      'SIGN_UP': 'Sign up'
      'SIGN_IN': 'Sign in'
      'LOG OUT': 'Log out'
      'EMAIL': 'Email'
      'PASSWORD': 'Password'
      'CONFIRM_PASSWORD': 'Confirm password'
      'ADD_PROJECT': 'Add TODO List'
      'PROJECT_FORM': 'Project Form',
      'SAVE': 'Save',
      'ADD_TASK': 'Add Task'
      'UPDATE_TASK': 'Update Task'
      'ADD_COMMENT': 'Add Comment'
      'NO_COMMENT': 'No comment'
    $translateProvider.preferredLanguage 'en'
    $translateProvider.useSanitizeValueStrategy 'escaped'
    return
]