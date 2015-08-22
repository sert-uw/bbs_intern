class BbsThread < ActiveRecord::Base
  has_many :responses, dependent: :destroy

  validates :name, presence: true
  validates :body, presence: true
  validates :password, presence: true
end
