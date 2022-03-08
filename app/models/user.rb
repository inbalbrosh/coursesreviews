class User < ApplicationRecord
  validates :first_name, :last_name, :password, :email, presence: true
  validates :email, uniqueness: { message: ': An account associated with %{value} already exists' }
end
