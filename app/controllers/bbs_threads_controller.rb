class BbsThreadsController < ApplicationController
  before_action :set_bbs_thread, only: [:show, :destroy]

  # GET /bbs_threads
  # GET /bbs_threads.json
  def index
    @bbs_threads = BbsThread.order("updated_at DESC").page(params[:page])
  end

  # GET /bbs_threads/1
  # GET /bbs_threads/1.json
  def show
    @responses = @bbs_thread.responses.order("updated_at DESC").page(params[:page])
    @response = @bbs_thread.responses.build
    read_res_session
  end

  # GET /bbs_threads/new
  def new
    @bbs_thread = BbsThread.new
    read_bbs_session
  end

  # POST /bbs_threads
  # POST /bbs_threads.json
  def create
    @bbs_thread = BbsThread.new(bbs_thread_params)

    respond_to do |format|
      if @bbs_thread.save
        write_bbs_session

        format.html { redirect_to @bbs_thread, notice: t('notice.thread.create') }
        format.json { render :show, status: :created, location: @bbs_thread }
      else
        format.html { render :new }
        format.json { render json: @bbs_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bbs_threads/1
  # DELETE /bbs_threads/1.json
  def destroy
    respond_to do |format|
      if @bbs_thread.destroy_validation delete_params
        format.html { redirect_to bbs_threads_path, notice: t('notice.thread.delete') }
        format.json { head :no_content }
      else
        format.html { redirect_to bbs_threads_path, alert: @bbs_thread.errors.full_messages }
        format.json { render json: @bbs_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bbs_thread
      @bbs_thread = BbsThread.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bbs_thread_params
      params.require(:bbs_thread).permit(:name, :address, :title, :body, :password)
    end

    def delete_params
      params.require(:bbs_thread).permit(:password)
    end

    def write_bbs_session
      session[:name] = @bbs_thread.name
      session[:address] = @bbs_thread.address
      session[:password] = @bbs_thread.password
    end

    def read_bbs_session
      @bbs_thread.name = session[:name]
      @bbs_thread.address = session[:address]
      @bbs_thread.password = session[:password]
    end

    def read_res_session
      @response.name = session[:name]
      @response.address = session[:address]
      @response.password = session[:password]
    end
end
