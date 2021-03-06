class BbsThread < ActiveRecord::Base
  has_many :responses, dependent: :destroy

  validates :name, presence: true
  validates :body, presence: true
  validates :password, presence: true

  def destroy_validation delete_params
    if password == delete_params[:password]
      destroy
      true
    else
      errors.add(:password, I18n.t('error.different'))
      false
    end
  end
end
