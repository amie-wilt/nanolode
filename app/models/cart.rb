class Cart < ActiveRecord::Base
  # TODO: Include Payola::Sellable

  has_many :line_items
  has_many :products, :through => :line_items

  # methods requires by Payola
  alias_attribute :price,     :total
  alias_attribute :permalink, :id
  alias_attribute :name,      :permalink

  def update_total
    update :total => line_items.sum(:subtotal)
  end

  def size
    line_items.sum(:quantity)
  end
end
