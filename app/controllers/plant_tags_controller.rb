class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    # from the form we receive the TAG ID
    @tag = Tag.find(params[:plant_tag][:tag])
    @plant_tag = PlantTag.new
    @plant_tag.tag = @tag
    # we are still missing the plant that this plant tag belongs to
    @plant_tag.plant = @plant
    if @plant_tag.save
      redirect_to garden_path(@plant.garden)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def plant_tag_params
    params.require(:plant_tag).permit(:tag)
  end
end
