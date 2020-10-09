class TransactionsController < ApplicationController
  # skip_before_action :verify_authenticity_token

    before_action :find_transaction, only: [:show, :update]
    
    def index
        transactions = Transaction.all
        render json: transactions, except: [:created_at, :updated_at]
    end

    def show
        render json: @transaction, except: [:created_at, :updated_at]
    end


    private

        def find_transaction
           @transaction = Transaction.find(params[:id])
        end

end
