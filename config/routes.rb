Rails.application.routes.draw do
  
  namespace 'api' do
    mount_devise_token_auth_for 'User', at: 'auth',
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
      
    resources :projects, except: [:edit, :new]
    resources :tasks, only: [:create, :destroy, :update]
    resources :comments, only: [:create, :destroy, :update]
  end 
  
  get '*path', to: 'application#angular'
  root 'application#angular'
end
