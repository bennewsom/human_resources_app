class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :company
  before_create :setup_company
  validates :first_name, :last_name, :company_name, presence: true
  
  
  private

   def setup_company
     company = Company.create(company_name: self.company_name)
     self.company = company
   end

end
