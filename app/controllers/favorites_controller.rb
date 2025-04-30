class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.find_or_create_by(favoritable_params)
    @favoritable_id = @favorite.favoritable_id
  end

  def destroy
    @favorite = Favorite.find_by(favoritable_params)
    @favoritable_id = @favorite.favoritable_id

    @favorite.destroy
  end

  protected
    def favoritable_params
      params.expect(favorite: %i[ favoritable_id favoritable_type ]).merge(user: current_user)
    end
end
