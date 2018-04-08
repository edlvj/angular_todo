angular.module('TodoApp').config [
  '$translateProvider'
  ($translateProvider) ->
    $translateProvider.translations 'en',
      'flash':
        'success_register': '<b>Well done!</b> You’re successfully registered!',
        'done_all_task': '<b>Well done!</b> You’re successfully completed all the task'
    $translateProvider.translations 'ua',
      'flash':
        'success_register': '<b>Вітаємо!</b> Ви успішно зареєструвалися!',
        'done_all_task': '<b>Вітаємо!</b> Ви успішно виконали всі задачі'
    $translateProvider.preferredLanguage 'en'

    $translateProvider.useSanitizeValueStrategy 'escaped'
    return
]