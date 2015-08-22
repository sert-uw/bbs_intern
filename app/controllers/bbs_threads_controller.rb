class BbsThreadsController < ApplicationController
  before_action :set_bbs_thread, only: [:show, :edit, :update, :destroy]

  # GET /bbs_threads
  # GET /bbs_threads.json
  def index
    @bbs_threads = BbsThread.all
  end

  # GET /bbs_threads/1
  # GET /bbs_threads/1.json
  def show
  end

  # GET /bbs_threads/new
  def new
    @bbs_thread = BbsThread.new
  end

  # GET /bbs_threads/1/edit
  def edit
  end

  # POST /bbs_threads
  # POST /bbs_threads.json
  def create
    @bbs_thread = BbsThread.new(bbs_thread_params)

    respond_to do |format|
      if @bbs_thread.save
        format.html { redirect_to @bbs_thread, notice: 'Bbs thread was successfully created.' }
        format.json { render :show, status: :created, location: @bbs_thread }
      else
        format.html { render :new }
        format.json { render json: @bbs_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bbs_threads/1
  # PATCH/PUT /bbs_threads/1.json
  def update
    respond_to do |format|
      if @bbs_thread.update(bbs_thread_params)
        format.html { redirect_to @bbs_thread, notice: 'Bbs thread was successfully updated.' }
        format.json { render :show, status: :ok, location: @bbs_thread }
      else
        format.html { render :edit }
        format.json { render json: @bbs_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bbs_threads/1
  # DELETE /bbs_threads/1.json
  def destroy
    @bbs_thread.destroy
    respond_to do |format|
      format.html { redirect_to bbs_threads_url, notice: 'Bbs thread was successfully destroyed.' }
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
