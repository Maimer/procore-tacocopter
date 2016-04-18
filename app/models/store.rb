class Store < ActiveRecord::Base
  has_and_belongs_to_many :tacos
  has_and_belongs_to_many :salsas
  belongs_to :city

  def self.search_by_tacos(tacos)
    if tacos.include?('all')
      includes(:tacos).all
    else
      includes(:tacos).where(tacos: { name: tacos })
    end
  end

  def self.search_by_salsas(salsas)
    if salsas.include?('all')
      includes(:salsas).all
    else
      includes(:salsas).where(salsas: { name: salsas })
    end
  end
end
