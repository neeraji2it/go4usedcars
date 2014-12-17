Rails.application.routes.draw do
  devise_for :admins
  root 'homes#index'
  resources :homes do
    collection do
      get :home
      get :about_us  
      get :buy_car
      get :sell_car
      get :auto_finance
      get :insurance
      
      get :faq
      get :testimonial
      get :careers
      get :contact_us
      get :associates_partners
    end
  end
  resources :testimonials 
  resources :careers

  namespace :admin do
    resources :dashboards
    resources :stocks do
      collection do
        get :addtostock
        post :create_model
        post :create_varient
        get  :car_model
        get :add_master_specification
        post :create_master_specification
      end
    end
    resources :vehicles do 
      collection do 
        get :load_car_model
        get :load_varients
      end
    end
    resources :car_specifications
  end
end