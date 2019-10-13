class CategoriesController < ApplicationController
  before_action :set_vertical
  before_action :set_vertical_category, only: [:show, :update, :destroy]

  def index
    json_response(@vertical.categories)
  end

  def show
    json_response(@category)
  end

  def create
    category = @vertical.categories.create!(category_params)
    json_response(category, :created)
  end

  def update
    @category.update(category_params)
    json_response(@category, :ok)
  end

  def destroy
    @category.destroy
    head :ok
  end

  private

  def set_vertical
    @vertical = Vertical.find(params[:vertical_id])
  end

  def set_vertical_category
    @category = @vertical.categories.find_by!(id: params[:id]) if @vertical
  end

  def category_params
    params.require(:category).permit(:name, :state)
  end
end
