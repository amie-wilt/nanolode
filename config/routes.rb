Rails.application.routes.draw do
  mount Payola::Engine => '/payola', as: :payola
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users

  resource :cart, :only => [:show, :update] do
    member { get '/:id', action: 'receipt', as: 'receipt' }
  end
end
