class Sub < ActiveRecord::Base
  validates :title, :moderator_id, presence: true
  # before_update :moderator?

  belongs_to(
    :moderator,
    class_name: "User",
    foreign_key: :moderator_id,
    primary_key: :id
  )

  has_many(
    :posts,
    class_name: "Post",
    foreign_key: :sub_id,
    primary_key: :id
  )

  def moderator?
    unless self.moderator_id == current_user.id
      raise "not authorized"
    end
  end

end
