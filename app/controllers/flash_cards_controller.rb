class FlashCardsController < ApplicationController
  def index
    @flash_cards = FlashCard.all
  end
end
