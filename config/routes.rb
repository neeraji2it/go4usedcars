Rails.application.routes.draw do

  devise_for :users, :controllers => {:omniauth_callbacks => "share_on_fbs"}
  devise_scope :user do
    get '/users/auth/:provider/callback' => 'share_on_fbs#create'
  end
  devise_for :admins
  get '/print/:id' => 'homes#print', :as => :print
  get '/send_details' => 'homes#send_details', :as => :send_details
  root 'homes#index'
  resources :homes do
    collection do
      get :about_us  
      match :buy_car, via: [:get, :post]
      get :load_model
      get :load_varient
      get :sell_car
      post :save_sell_car
      get :auto_finance
      get :insurance
      match :home, via: [:get, :post]
      get :call_me
      get :faq
      get :testimonial
      get :careers
      get :contact_us
      get :associates_partners
      post :save_post_req
      get :offers
    end
    member do
      get :car_description
    end
  end
  resources :testimonials 
  resources :careers
  resources :associate_partners

  namespace :admin do
    resources :dashboards do
      collection do
        get :testimonials
        get :dealers
        get :dealer_cars
      end
      member do 
        put :approved
        match :move_to_stock, via: [:get, :put]
        put :approve_testimonial
      end
    end

    resources :stocks do
      collection do
        get :addtostock
        post :create_model
        post :create_varient
        get  :car_model
        get :display_car_varient
        get :add_master_specification
        post :create_master_specification
        get :edit_stock
        match :update_model, via: [:get, :put]
        get :list_varient
        match :update_varient, via: [:get, :put]
        get :live_cars
        get :sold_cars
        get :offer
        get :edit_offer
        put :update_offer
      end
      member do
        delete :delete_procure_enquiry
        put :sold
        put :unsold
        put :remove_offer
      end
    end

    resources :vehicles do 
      collection do 
        get :load_car_model
        get :load_varients
        get :edit_vehicle
      end
      member do 
        put :update_vehicle
      end
    end

    resources :car_specifications do
      collection do 
        get :edit_car_specification
      end
      member do 
        get :edit_car_specific
        put :update_car_specific
      end
    end

    resources :images do
      collection do
        post :create_video
      end
    end

    resources :purchase_procedures do
      collection do
        get :procure_enquiry
        get :new_evaluation
        post :create_evaluation
        get :waiting_to_evaluate
        get :deal
        put :update_deal
        get :evaluated
        get :final_deal
        put :update_final_deal
        get :purchased_car
        get :publish_vehicle
        post :save_vehicle
        get :specification_entry
        post :create_specification
      end
    end

    resources :sell_procedures do
      collection do
        get :enquiry
        get :new_evaluation
        post :create_evaluation
      end
    end

    resources :testimonials

  end

  namespace :user do
    resources :registrations do
      collection do
        get :update_status
      end
    end
  end

  namespace :dealer do
    resources :dashboards
    resources :vehicles
  end
end