class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.published
  end
end
