class EnemiesController < ApplicationController
  before_action :set_enemie, except: [:index, :create]

  def index
    @enemies = Enemy.all
    render json: @enemies, status: :ok
  end

  def show
    render json: @enemy, status: :ok
  end

  def create
    @enemy = Enemy.new(enemie_params)

    if @enemy.save
      render json: @enemy, status: :ok
    else
      render json: { errors: @enemy.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @enemy.update(enemie_params)
      render json: @enemy, status: :ok
    else
      render json: { errors: @enemy.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @enemy.destroy
    head 204
  end

  private

  def enemie_params
    params.require(:enemy).permit(:name, :power_base, :power_step, :level, :kind)
  end

  def set_enemie
    @enemy = Enemy.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { message: e.message }, status: :not_found
  end
end
