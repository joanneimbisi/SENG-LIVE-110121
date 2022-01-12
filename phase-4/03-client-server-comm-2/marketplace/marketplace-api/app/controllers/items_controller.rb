class ItemsController < ApplicationController

    def index 
        render json: Item.all
    end

    def show 
        item = Item.find_by_id(params[:id])
        if item 
            render json: item
        else 
            render json: { error: "Item not found" }, status: :not_found
        end
    end

    # def create 
    #     item = current_user.sold_items.create(item_params)

    #     if item.valid? 
    #         render json: item, status: :created  
    #     else 
    #         render json: {error: item.errors.full_messages}, status: :unprocessable_entity 
    #     end
    # end
    def create 
        item = current_user.sold_items.create!(item_params)
        render json: item, status: :created 

    rescue ActiveRecord::RecordInvalid => invalid 
        byebug
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
    
    # def create 
    #     item = current_user.sold_items.new(item_params)

    #     if item.save
    #         render json: item, status: :created  
    #     else 
    #         render json: {error: item.errors.full_messages}, status: :unprocessable_entity 
    #     end
    # end





    private 

    # strong_params 

    def item_params 
        params.permit(:name, :price, :desc)
    end
end
