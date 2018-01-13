class JobListing < ApplicationRecord
    has_many :children
    belongs_to :parent
    validates :info, presence: true
    validates :parent, presence: true
end
