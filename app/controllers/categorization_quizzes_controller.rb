class CategorizationQuizzesController < ApplicationController
  before_action :set_categorization_quiz, only: %i[show submit]

  def index
    @categorization_quizzes = CategorizationQuiz.all
  end

  def show
    @categories = @categorization_quiz.categories
    @category_items = @categorization_quiz.category_items.randomize
    @submission_params = @categories.pluck(:id).each_with_object({}) { |key, hash| hash[key] = [] }.to_json
  end

  def submit
    answers = JSON.parse categorization_quiz_submission_params[:answers]
    answers = answers.transform_keys(&:to_i).transform_values { |v| v.map(&:to_i) }
    score = QuizAnswersCheckerService.call(quiz: @categorization_quiz, answers:)
  end

  protected
    def set_categorization_quiz
      @categorization_quiz = CategorizationQuiz.find params[:id]
    end

    def categorization_quiz_submission_params
      @categorization_quiz_submission_params ||= params.require(:categorization_quiz_submission).permit(:answers).merge(user: current_user)
    end
end
