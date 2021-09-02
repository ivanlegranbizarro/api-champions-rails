# Rutas para nuestra API
Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :champions #Se accede a la ruta /api/v1/champions
    end
  end
end
