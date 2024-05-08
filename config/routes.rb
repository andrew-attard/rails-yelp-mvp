Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # CRUD routes - routes we require to perform one of the 7 CRUD actions:
  # index, show, new, create, edit, update, destroy
  # We should only use those which we require for our application
  # Note also that in this case since reviews are directly related to a restaurant,
  # we do not need to have :index or :show routes
  # Since many reviews are directly related to a single restaurant and will appear in the route as
  # restaurants/id/reviews, we nest it within the restaurants route
  resources :restaurants, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
  end
end

  # As an example, Doug also showed some non-CRUD routes (routes which are not used
  # to create, read, update, delete), to show how they may work.  For example,
  # you might create a :top route for the restaurants collection which shows a subset
  # colleciton of all restaurants, or show a specific chef (member). An example is
  # shown below

  # Non-CRUD routes in routes.rb
  # ====
  # collection do
  #   get :top
  # end
  # member do
  #   get :chef
  # end

  # Non-CRUD routes in restaurants_controller.rb
  # ====
  # '/restaurants/top'
  # def top
  #   @restaurants = Restaurant.where(rating: 5)
  # end

  # # '/restaurants/1/chef'
  # def chef
  #   @restaurant = Restaurant.find(params[:id])
  # end

  # ==============================================================
  # User Stories
  # ------
  # A visitor can see the list of all restaurants
  # GET "restaurants"

  # A visitor can add a new restaurant, and be redirected to the show view of that new restaurant.
  # GET "restaurants/new"
  # POST "restaurants"

  # A visitor can see the details of a restaurant, with all the reviews related to the restaurant.
  # GET "restaurants/38"

  # A visitor can add a new review to a restaurant
  # GET "restaurants/38/reviews/new"
  # POST "restaurants/38/reviews"

  # Defines the root path route ("/")
  # root "posts#index"
