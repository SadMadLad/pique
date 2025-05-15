class QuizAnswersCheckerService < ApplicationService
  required_params :quiz, :answers

  def call
    check_answers
  end

  private
    def check_answers
      send(:"#{@quiz.class.name.underscore}_check")
    end

    def categorization_quiz_check
      score = 0

      categories = @quiz.categories.includes(:category_items).all
      categories.each do |category|
        category_items = category.category_items.pluck(:id)

        @answers[category.id].each do |answer_category_id|
          score += 1 if category_items.include?(answer_category_id.to_i)
        end
      end

      score
    end
end
