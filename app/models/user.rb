class User < ActiveRecord::Base # :nodoc:
  has_secure_password

  validates :email, presence: true,
                    uniqueness: true,
                    format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates_presence_of :first_name, :last_name

  has_many :favorites, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end
end
