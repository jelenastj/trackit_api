class TransactionsController < ApplicationController
    
    before_action :find_transaction, only: [:show]


    def index
        transactions = Transaction.all
        render json: transactions, except: [:created_at, :updated_at]
    end

    def show
        render json: @transaction, except: [:created_at, :updated_at]
    end

    def new
        gear = Transaction.new
    end

    def create
        transaction = Transaction.create(transaction_params)
        if (transaction.valid?)
            render json: transaction
        else
            render json: { errors: transaction.errors.full_messages }, status: :not_acceptable
        end
    end

    

  

    private

    def find_transaction
       @transaction = Transaction.find(params[:id])
    end

    def transaction_params
        params.require(:transaction).permit(:date, :name,:category, :amount,:user_id,)
    end
end
