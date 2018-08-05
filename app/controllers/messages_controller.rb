class MessagesController < ApplicationController
    before_action :find_message, only: [:edit, :update, :show, :destroy]

    
    def index
        @messages = Message.all 
        puts @messages
    end

    def new
       @message = Message.new 
    end

    def create
        @message = Message.new(message_params)

        if @message.save
            redirect_to root_path
        else
            render 'new'            
        end
    end

    def show
        @message = Message
    end
    
    
    private 
    def message_params
        params.require(:message).permit(:title, :description)
    end
    def find_message
        @message = Message.find(params[:id])
    end

    
end
