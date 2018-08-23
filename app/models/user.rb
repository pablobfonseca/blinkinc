class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  def self.search(query)
    query            = "%#{query}%"
    first_name_match = arel_table[:first_name].matches(query)
    last_name_match  = arel_table[:last_name].matches(query)
    email_match      = arel_table[:email].matches(query)

    where(first_name_match.or(last_name_match).or(email_match))
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
