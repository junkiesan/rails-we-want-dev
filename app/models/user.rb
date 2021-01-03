class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :subscription

  after_create :set_subscription

  private

  def set_subscription
    Subscription.create(user_id: self.id, plan: 'free', active_until: 1.week.from_now)
  end
end
