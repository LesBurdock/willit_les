class ValuablesController < ApplicationController
  before_action :set_valuables, only: [:show, :edit, :update, :destroy]

  def index
    @valuables = Valuable.all
  end

  def items
    @category = params[:category]
    @valuables = Valuable.all
  end

  def show
    @valuables = Valuable.all
  end

  def new
    @valuable = Valuable.new
    @category = params[:category]
    @item = params[:item]
  end

  def create
    @valuable = Valuable.new(valuable_params)
    @valuable.user = current_user
    if @valuable.save
      redirect_to valuable_path(@valuable), notice: 'Valuable was saved'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @valuable.update(valuable_params)
      @valuable.save
      redirect_to @valuable, notice: 'Valuable was updated'
    else
      render :edit
    end
  end

  def destroy
    @valuable.destroy
    redirect_to valuables_path, notice: 'Valuable was removed'
  end

  private

  def set_valuables
    @valuable = Valuable.find(params[:id])
  end

  def valuable_params
    params.require(:valuable).permit(:title, :image_url, :value, :description, :photo, :category, :item)
  end
end
