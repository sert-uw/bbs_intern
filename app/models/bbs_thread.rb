class BbsThread < ActiveRecord::Base
  has_many :responses, dependent: :destroy
end
