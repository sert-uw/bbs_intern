class ResponsesController < ApplicationController
  before_action :set_thread
  before_action :set_response, only: [:destroy]

  # POST /responses
  # POST /responses.json
  def create
    @response = @bbs_thread.responses.build(response_params)

    respond_to do |format|
      if @response.save
        write_session

        format.html { redirect_to bbs_thread_path(@bbs_thread.id), notice: t('notice.response.create') }
        format.json { render :show, status: :created, location: @bbs_response }
      else
        format.html { redirect_to bbs_thread_path(@bbs_thread.id), alert: @response.errors.full_messages }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    respond_to do |format|
      if @response.destroy_validation delete_params
        format.html { redirect_to bbs_thread_path(@bbs_thread.id), notice: t('notice.response.delete') }
        format.json { head :no_content }
      else
        format.html { redirect_to bbs_thread_path(@bbs_thread.id), alert: @response.errors.full_messages }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_thread
      @bbs_thread = BbsThread.find(params[:bbs_thread_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:response).permit(:name, :address, :body, :password)
    end

    def delete_params
      params.require(:response).permit(:password)
    end

    def write_session
      session[:name] = @bbs_thread.name
      session[:address] = @bbs_thread.address
      session[:password] = @bbs_thread.password
    end
end
