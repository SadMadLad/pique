class Quiz < ApplicationRecord
  include Collectable
  include Favoritable
  include Taggable

  belongs_to :user

  has_many :questions, dependent: :destroy
  has_many :question_options, through: :questions

  has_one_attached :cover

  validates :timer, presence: true, comparison: { greater_than: 0 }, if: :timed?
  validates :title, :description, presence: true

  scope :published, -> { where(published: true) }
  scope :drafted, -> { where(published: false) }

  accepts_nested_attributes_for :questions

  def score_selected_options(selected_options)
    questions_array = questions.includes(:question_options)
    total_score = 0

    selected_options.each do |question_id, selected|
      q = questions_array.find { |question| question.id == question_id }
      total_score += q.score_selected_options(selected)
    end

    total_score
  end
end
