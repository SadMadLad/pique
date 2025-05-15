class OrderingQuizzesController < ApplicationController
  before_action :set_ordering_quiz, only: %i[show submit]

  def index
    @ordering_quizzes = OrderingQuiz.all
  end

  def show
    @ordering_items = @ordering_quiz.ordering_items
  end

  def submit
  end

  private
    def set_ordering_quiz
      @ordering_quiz = OrderingQuiz.find(params[:id])
    end
end
