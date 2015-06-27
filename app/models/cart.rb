class Cart < ActiveRecord::Base
  # TODO: Include Payola::Sellable

  has_many :line_items
  has_many :products, through: :line_items

  # additional methods required by Payola
  alias_attribute :price, :total
  alias_attribute :name,  :id

  def update_total
    update total: line_items.sum(:subtotal)
  end

  def size
    line_items.sum(:quantity)
  end

  def permalink
    Rails.application.routes.url_helpers.receipt_cart_url(id)
  end
end
