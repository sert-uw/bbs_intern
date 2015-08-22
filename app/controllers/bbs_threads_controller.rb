class BbsThreadsController < ApplicationController
  before_action :set_bbs_thread, only: [:show, :destroy]

  # GET /bbs_threads
  # GET /bbs_threads.json
  def index
    @bbs_threads = BbsThread.order("updated_at DESC")
  end

  # GET /bbs_threads/1
  # GET /bbs_threads/1.json
  def show
  end

  # GET /bbs_threads/new
  def new
    @bbs_thread = BbsThread.new
  end

  # POST /bbs_threads
  # POST /bbs_threads.json
  def create
    @bbs_thread = BbsThread.new(bbs_thread_params)

    respond_to do |format|
      if @bbs_thread.save
        format.html { redirect_to @bbs_thread, notice: t('notice.thread.create') }
        format.json { render :show, status: :created, location: @bbs_thread }
      else
        format.html { render :new, notice: t('err.not_enough') }
        format.json { render json: @bbs_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bbs_threads/1
  # DELETE /bbs_threads/1.json
  def destroy
    @bbs_thread.destroy
    respond_to do |format|
      format.html { redirect_to bbs_threads_url, notice: t('notice.thread.delete') }
      format.json { head :no_content }
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
end
