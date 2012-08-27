EotFreelance::Application.routes.draw do  
  resources :services

  resources :projects do
    resources :areas
    resources :specializations
  end

  devise_scope :camrade do
    get 'login', to: 'devise/sessions#new', as: :login
    get 'logout', to: 'devise/sessions#destroy', as: :logout
    get 'register', to: 'devise/registrations#new', as: :register
  end
  
  devise_for :camrades
  
  resources :camrades do
    resources :resumes
    get 'show_messages'
  end
  resources :companies, only: [:index]
  resources :messages, only: [:show, :create]
  
  match 'add_area/:project_id' => 'specializations#add_area', as: :add_area
  match 'specializations/(:area_id)' => 'specializations#index', as: :specializations
  match 'project/:id/add_area' => 'projects#add_specialization', as: :project_add_specialization
  match 'project/:id/add_specialization' => 'projects#add_specialization', as: :project_add_specialization
  
  match 'resume/:id/specialization/:specialization_id/delete' => 'resumes#delete_resume_specialization', as: :delete_resume_specialization
  root to: 'welcome#index'
end
