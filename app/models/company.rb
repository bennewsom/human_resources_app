class Company < ActiveRecord::Base
    has_many :departments
    validates :compname, presence: true
end