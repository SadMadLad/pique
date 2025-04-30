class Question < ApplicationRecord
  SCORE_FOR_MULTIPLE_ANSWERS = 2.0

  has_many :question_options, dependent: :destroy

  belongs_to :quiz, counter_cache: true

  has_one_attached :picture

  validates :score, presence: true, comparison: { greather_than: 0, less_than: 100 }

  accepts_nested_attributes_for :question_options

  def score_selected_options(selected_options)
    correct_options = question_options.select(&:correct?).pluck(:id)

    if multiple_answers
      score_for_multiple_answers(correct_options, selected_options)
    else
      selected_options == correct_options.first ? score : 0
    end
  end

  private

  def score_for_multiple_answers(correct_options, selected_options)
    cummulative_score = 0.0
    score_per_correct_answer = score.to_f / correct_options.length

    selected_options.each do |selected_option|
      if correct_options.include?(selected_option)
        cummulative_score += score_per_correct_answer
      else
        cummulative_score -= score_per_correct_answer
      end
    end

    [ cummulative_score, 0 ].max
  end
end
