class Response < ActiveRecord::Base
  belongs_to :bbs_thread

  validates :name, presence: true
  validates :address, presence: true
  validates :body, presence: true
  validates :password, presence: true
end
