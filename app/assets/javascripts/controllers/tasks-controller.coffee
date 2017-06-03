TasksController = (Task, $state, $scope, $uibModal, $filter, Flash) ->
  ctrl = @

  ctrl.create = (form, project) ->
    Task.create(form)
      .success (resp) ->
        project.tasks.push(resp)
      .error (resp) ->
        Flash.create 'warning', resp.data.error
        
  ctrl.edit = (task_id, project) -> 
    ctrl.edit_modal = $uibModal.open
      templateUrl: 'edit_task.html'
      size: 'md'
      controller: ($scope) ->
        $scope.update = (form) ->
          ctrl.update(task_id, form, project)
          ctrl.edit_modal.close()
          
  ctrl.update = (task_id, form, project) ->
    Task.update(task_id, form)
      .success (resp) ->
        index = project.tasks.indexOf($filter('filter')(project.tasks, id: task_id)[0])
        project.tasks[index].title = resp.title
      .error (resp) ->
        Flash.create 'warning', resp.data.error    
        
  ctrl.delete = (task_id, project) -> 
    Task.delete(task_id)
      .success (resp) ->
        index = project.tasks.indexOf($filter('filter')(project.tasks, id: task_id)[0])
        project.tasks.splice(index, 1)
      .error (resp) ->
        Flash.create 'warning', resp.data.error      
        
  ctrl.done = (task_id, project) -> 
    Task.update(task_id, {done: true})
      .success (resp) ->
        index = project.tasks.indexOf($filter('filter')(project.tasks, id: task_id)[0])
        project.tasks[index].done = resp.done
      .error (resp) ->
        Flash.create 'warning', resp.data.error 
  
  ctrl.sort = 
    handle: '.handle',
    stop:  (e, ui) ->    
      task = ui.item.scope().task
      task.position = ui.item.index() + 1
      Task.update(task.id, { priority: task.position })
        .error (resp) ->
          Flash.create 'warning', resp.data.error 
  
  return
  
angular.module('TodoApp').controller 'TasksController', [
  'Task',
  '$state',
  '$scope',
  '$uibModal',
  '$filter',
  'Flash',
  TasksController
]