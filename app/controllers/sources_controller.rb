class SourcesController < ApplicationController
  before_action :set_source, only: %i[ show edit update destroy ]

  # GET /sources
  def index
    @sources = Source.all
  end

  # GET /sources/1
  def show
  end

  # GET /sources/new
  def new
    @source = Source.new
  end

  # GET /sources/1/edit
  def edit
  end

  # POST /sources
  def create
    @source = Source.new(source_params)

    if @source.save
      redirect_to @source, notice: "Source was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /sources/1
  def update
    if @source.update(source_params)
      redirect_to @source, notice: "Source was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /sources/1
  def destroy
    @source.destroy!
    redirect_to sources_path, notice: "Source was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source
      @source = Source.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def source_params
      params.expect(source: [ :title, :description, :url ])
    end
end
