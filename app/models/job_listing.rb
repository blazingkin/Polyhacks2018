class JobListing < ApplicationRecord
    has_many :children
    validates :text, presence: true
    validates :parent, presence: true
end
