class Card < ActiveRecord::Base
  validates :original_text, presence: true
  validates :translated_text, presence: true
  validates :review_date, presence: true
  validate :same_fields

  before_validation :update_review_date, on: :create

  protected

  def update_review_date
    self.review_date = 3.days.since
  end

  def same_fields
    if original_text.downcase == translated_text.downcase
      errors.add(:translated_text, "Оригинал и перевод не могут быть одинаковыми!")
    end
  end  
end
