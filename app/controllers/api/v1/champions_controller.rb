module Api
  module V1
    # El nombre del controlador debe ser en plural y la clase se debe llamar igual al controlador
    class ChampionsController < ApplicationController
      # Método para acceder a un listado con los campeones registrados en la base de datos
      def index
        champions = Champion.order('created_at DESC')
        render json: {
          status: 'success',
          message: 'Listado de campeones',
          data: champions
        }, status: :ok
      end

      # Método para obtener los detalles de un campeón en concreto

      def show
        champion =Champion.find(params[:id])
        render json: {
          status: 'success',
          message: 'Detalles del campeón:',
          data: champion
        }, status: :ok
      end


      def create
        # Referencia al modelo
        champion = Champion.new(champion_params)
        if champion.save
          render json: {
            status: 'success',
            message: 'Campeón creado',
            data: champion
          }, status: :ok
        else
          render json: {
            status: 'error',
            mesage: 'Campeón no creado',
            data: champion.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      def destroy
        champion = Champion.find(params[:id])
        if champion.destroy
          render json: {
            status: :no_content,
            message: 'Campeón eliminado.',
            data: champion
          }, status: :ok
        else
          render json: {
            status: 'error',
            message: 'Campeón no eliminado.',
            data: champion.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      def update
        champion = Champion.find(params[:id])
        # Utilizar el método update_attributes de Ruby
        if champion.update_attributes(champion_params)
          render json: {
            status: :success,
            message: "Campeón actualizado",
            data: champion
          }, status: :ok
        else
          render json: {
            status: 'error',
            message: 'Campeón no actualizado',
            data: champion.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      # Parámetros que queremos utilizar para el create
      private
      # Tienen que ser los mismos parámetros que definimos como required
      def champion_params
        params.permit(:name, :region, :rol, :composition)
      end
    end
  end
end
