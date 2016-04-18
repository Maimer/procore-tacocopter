class TacocopterController < ApplicationController

  def index
    @tacos = Taco.all
    @salsas = Salsa.all
  end

  def show
    if params[:taco].nil? && params[:salsa].nil?
      redirect_to action: 'index'
    end

    @taco_results, @salsa_results = [], []
    @taco_results = Store.search_by_tacos(params[:taco]) if params.key?(:taco)
    @salsa_results = Store.search_by_salsas(params[:salsa]) if params.key?(:salsa)
    if @salsa_results.empty? || @taco_results.empty?
      @stores = (@salsa_results + @taco_results)
    else
      @stores = (@salsa_results & @taco_results)
    end
    @stores.uniq! { |store| [store.name, store.city_id] }
  end
end
