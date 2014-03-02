class User < ActiveRecord::Base
  has_many :inventories
  has_many :inventories, dependent: :destroy
  
  has_many :equipment
  has_many :equipment, dependent: :destroy
  
  #additions
  has_many :fields
  has_many :fields, dependent: :destroy
  
  has_many :observations
  has_many :observations, dependent: :destroy
  
  has_many :expenses
  has_many :expense, dependent: :destroy
  
  has_many :profitplanners
  has_many :profitplanners, dependent: :destroy
  
  has_many :topics, :dependent => :destroy
  has_many :posts, :dependent => :destroy
 
  

  before_create :create_remember_token
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
   def listing
    Field.where("user_id = ?", id)
  end
  
  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
