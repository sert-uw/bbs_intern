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
end
