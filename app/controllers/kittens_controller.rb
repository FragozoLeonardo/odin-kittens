# frozen_string_literal: true

class KittensController < ApplicationController
  # frozen_string_literal: true

  before_action :set_kitten, only: %i[show edit update destroy]

  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kittens }
      format.json { render :json => @kittens }
    end

  end

  def show
    set_kitten
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to @kitten, notice: 'Successfully created kitten.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    set_kitten

    if @kitten.update(kitten_params)
      redirect_to @kitten
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    set_kitten
    @kitten.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
