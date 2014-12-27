class FormatsController < ApplicationController
  before_action :set_format, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show]
  before_action :authorized_user, only: [:edit, :update, :destroy]
  respond_to :html, :json



  # GET /formats
  # GET /formats.json
  def index
    @formats = Format.all
  end

  # GET /formats/1
  # GET /formats/1.json
  def show
  end

  # GET /formats/new
  def new
    @format = current_user.formats.build
  end

  # GET /formats/1/edit
  def edit
  end

  def authorized_user
  @format = current_user.formats.find_by(id: params[:id])
  redirect_to formats_path, notice: "Not authorized to edit this format" if @format.nil?
end

  # POST /formats
  # POST /formats.json
  def create
    @format = current_user.formats.build(format_params)

    respond_to do |format|
      if @format.save
        format.all { redirect_to @format, notice: 'Format was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @format }
      else
        format.all { render action: 'new' }
        #format.json { render json: @format.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formats/1
  # PATCH/PUT /formats/1.json
  def update
    respond_to do |format|
      if @format.update(format_params)
        format.all { redirect_to @format, notice: 'Format was successfully updated.' }
        #format.json { head :no_content }
      else
        format.all { render action: 'edit' }
        #format.json { render json: @format.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formats/1
  # DELETE /formats/1.json
  def destroy
    @format.destroy
    respond_to do |format|
      format.html { redirect_to formats_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_format
      @format = Format.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def format_params
      params.require(:format).permit(:name, :usage, :compression, :resolution, :algorithme, :ordretrame)
    end
end
