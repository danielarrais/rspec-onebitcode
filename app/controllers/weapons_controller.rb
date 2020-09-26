class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all
  end

  def create
    @weapon = Weapon.create(weapons_params)
    redirect_to weapons_path
  end

  def destroy
    @weapon = Weapon.find(params[:id])
    if @weapon.destroy
      redirect_to weapons_path
    end
  end

  def show
    @weapon = Weapon.find(params[:id])
  end

  private

  def weapons_params
    params.require(:weapon).permit(:name, :description, :power_base, :power_step, :level)
  end
end
