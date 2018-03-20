TasksController = (Task, $state, $scope, $uibModal, $filter, Flash) ->
  ctrl = @
  
  ctrl.create = (form, project) ->
    Task.create({ title: form.title.$modelValue, project_id: project.id })
      .success (resp) ->
        project.tasks.push(resp)
      .error (resp) ->
        Flash.create 'warning', resp.error
          
  ctrl.update = (project, task, form) ->
    Task.update(task.id, form)
      .success (resp) ->
        index = project.tasks.indexOf($filter('filter')(project.tasks, id: task.id)[0])
        project.tasks[index] = resp
      .error (resp) ->
        Flash.create 'warning', resp.error

  ctrl.deadline = (project, task) ->
    ctrl.deadline_modal = $uibModal.open
      templateUrl: 'tasks/_deadline.html'
      size: 'md'
      controller: ($scope) ->
        $scope.Date = new Date()
        $scope.task = task
        $scope.setDeadline = (form)->
          ctrl.update(project, task, { deadline: form.deadline.toISOString()})
          ctrl.deadline_modal.close()
        $scope.cancel = () ->
          ctrl.deadline_modal.close()

  ctrl.comment = (task) ->
    ctrl.comment_modal = $uibModal.open
      templateUrl: 'tasks/_comment.html'
      size: 'md'
      controller: ($scope) ->
        $scope.task = task
        $scope.cancel = () ->
          ctrl.comment_modal.close()

  ctrl.remove = (task, project) ->
    ctrl.remove_modal = $uibModal.open
      templateUrl: 'tasks/_delete.html'
      size: 'md'
      controller: ($scope) ->
        $scope.project = project
        $scope.task = task
        $scope.ok = () ->
          ctrl.delete(task.id, project)
          ctrl.remove_modal.close()
        $scope.cancel = () ->
          ctrl.remove_modal.close()      
        
  ctrl.delete = (task_id, project) -> 
    Task.delete(task_id)
      .success (resp) ->
        index = project.tasks.indexOf($filter('filter')(project.tasks, id: task_id)[0])
        project.tasks.splice(index, 1)
      .error (resp) ->
        Flash.create 'warning', resp.error      
        
  ctrl.done = (task, project, done) -> 
    ctrl.update(project, task, { done: done || false })
      .success (resp) ->
        index = project.tasks.indexOf($filter('filter')(project.tasks, id: task.id)[0])
        project.tasks[index].done = resp.done
  
  ctrl.move = (project, index, new_index) ->
    # temp = project.tasks[new_index];
    # project.tasks[new_index] = project.tasks[index];
    # project.tasks[index] = temp;
    console.log tasks[index].id
    console.log new_index
    #ctrl.update(project, tasks[index], { priority: new_index })

  ctrl.moveUp = (project, index) ->
    ctrl.move(project, index, index - 1);

  ctrl.moveDown = (project, index) ->
    ctrl.move(project, index, index + 1);
  
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