class BulletinBoard < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :recruitments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  belongs_to :user
  has_many :liked_users, through: :likes, source: :user
  has_many :tag_relations, dependent: :destroy
  has_many :tags, through: :tag_relations

  validates :title, presence: true
  validates :content, presence: true

  def self.search(search)
    if search
      BulletinBoard.where(['content LIKE ?', "%#{search}%"])
    else
      BulletinBoard.all
    end
  end

  def create_notification_like!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and bulletin_board_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        bulletin_board_id: id,
        visited_id: user_id,
        action: 'like'
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_recruitment!(current_user, recruitment_id)
    temp_ids = Recruitment.select(:user_id).where(bulletin_board_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, recruitment_id, temp_id['user_id'])
    end
    save_notification_comment!(current_user, recruitment_id, user_id) if temp_ids.blank?
  end

  def save_notification_recruitment!(current_user, recruitment_id, visited_id)
    notification = current_user.active_notifications.new(
      bulletin_board_id: id,
      recruitment_id: recruitment_id,
      visited_id: visited_id,
      action: 'recruitment'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
