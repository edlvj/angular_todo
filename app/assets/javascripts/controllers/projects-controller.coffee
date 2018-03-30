ProjectsController = (Project, $stateParams, $state, $scope, $uibModal, $filter, Flash) ->
  ctrl = @
  ctrl.all = []

  ctrl.index = () ->
    Project.all()
      .success (resp) ->
        ctrl.all = resp
      .error (resp) ->
        Flash.create 'warning', resp   

  ctrl.create = (form) ->
    if form.$valid
      Project.create({ title: form.title.$modelValue})
        .success (resp) -> 
          ctrl.all.push(resp)
        .error (resp) ->
          Flash.create 'warning', resp.error
   
  ctrl.update = (project_id, form) ->
    if form.$valid
      Project.update(project_id, { title: form.title.$modelValue})
        .success (resp) ->
          index = ctrl.all.indexOf($filter('filter')(ctrl.all, id: project_id)[0]) 
          ctrl.all[index].title = form.title.$modelValue
        .error (resp) ->
          Flash.create 'warning', resp.error

  ctrl.remove = (project) ->
    ctrl.remove_modal = $uibModal.open
      templateUrl: 'projects/_delete.html'
      size: 'md'
      controller: ($scope) ->
        $scope.project = project
        $scope.ok = () ->
          ctrl.delete(project.id)
          ctrl.remove_modal.close()
        $scope.cancel = () ->
          ctrl.remove_modal.close()
        
  ctrl.delete = (project_id) ->
    Project.delete(project_id)
      .success (resp) ->
        index = ctrl.all.indexOf($filter('filter')(ctrl.all, id: project_id)[0])
        ctrl.all.splice(index, 1)
      .error (resp) ->
        Flash.create 'warning', resp.error

  ctrl.index()
  
  return

angular.module('TodoApp').controller 'ProjectsController', [
  'Project',
  '$stateParams',
  '$state',
  '$scope',
  '$uibModal',
  '$filter',
  'Flash',
  ProjectsController
]