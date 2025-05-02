class CategorizationQuizzesController < ApplicationController
  before_action :set_categorization_quiz, only: %i[show]

  def index
    @categorization_quizzes = CategorizationQuiz.all
  end

  def show
    @categories = @categorization_quiz.categories
    @category_items = @categorization_quiz.category_items.randomize
  end

  protected
    def set_categorization_quiz
      @categorization_quiz = CategorizationQuiz.find params[:id]
    end
end
