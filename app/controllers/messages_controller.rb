class MessagesController < ApplicationController
  def index
    @messages = Message.all

  end
  def create
    @message = Message.new(:body => params[:message][:body])

    respond_to do |format|
      if @message.save

        sync_new @message
        format.js {}
      end
    end

  end
  private
    def message_parms
        params.require(:message).permit(:body)
    end
end
