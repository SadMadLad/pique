class FlashCardsController < ApplicationController
  def index
    @flash_cards = FlashCard.published
  end
end
