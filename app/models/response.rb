class Response < ActiveRecord::Base
  belongs_to :bbs_thread

  validates :name, presence: true
  validates :body, presence: true
  validates :password, presence: true

  after_save :update_thread_updated

  def update_thread_updated
    if bbs_thread.present?
      bbs_thread.updated_at = updated_at
      bbs_thread.save
    end
  end

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
