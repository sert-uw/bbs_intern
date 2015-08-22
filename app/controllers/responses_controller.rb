class ResponsesController < ApplicationController
  before_action :set_thread
  before_action :set_response, only: [:destroy]

  # POST /responses
  # POST /responses.json
  def create
    @response = @thread.responses.build(response_params)

    respond_to do |format|
      if @response.save
        format.html { redirect_to bbs_thread_path(@thread.id), notice: 'Response was successfully created.' }
        format.json { render :show, status: :created, location: @response }
      else
        format.html { redirect_to bbs_thread_path(@thread.id) }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to bbs_thread_path(@thread.id), notice: 'Response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_thread
      @thread = BbsThread.find(params[:bbs_thread_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:response).permit(:name, :address, :body, :password)
    end
end
