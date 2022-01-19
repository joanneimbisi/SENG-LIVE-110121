class User < ApplicationRecord
    has_secure_password 

    # password= 
    # authenticate 
    
    has_many :purchased_items, class_name: 'Item', foreign_key: 'buyer_id', dependent: :nullify 
    has_many :sold_items, class_name: 'Item', foreign_key: 'seller_id', dependent: :nullify
    
    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
end
