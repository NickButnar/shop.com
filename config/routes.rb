Rails.application.routes.draw do
  namespace 'admin' do
    devise_for :user_admins, path: '', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'signup'
    }, controllers: {
      sessions: 'admin/sessions'
    }
    resources :products
    root 'products#index'
  end

  root 'home#index'
end
