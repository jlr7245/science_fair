Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  get "/about" => "pages#about"

  resources :users, only: [:new, :create]
  get "/dashboard" => "users#dashboard"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  resources :cohorts do
    resources :projects, except: [:index]
    get "/projects" => "projects#cohort_projects_index"
  end

  resources :projects, only: [:index] do
    resources :sites
  end

  resources :tours, only: [:create] do
    get "/sites/:id" => "sites#show_tour", as: "site_with_chat"
    get "/random_site" => "tours#random_site"
  end

  resources :messages, only: [:create, :destroy]
end
