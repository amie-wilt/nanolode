class Cart < ActiveRecord::Base
  include Payola::Sellable

  has_many :line_items
  has_many :products, through: :line_items

  after_initialize :generate_permalink

  # additional method required by Payola
  alias_attribute :price, :total

  def update_total
    update total: line_items.sum(:subtotal)
  end

  def size
    line_items.sum(:quantity)
  end

  def description
    case size
    when 0
      'Empty Cart.'
    when 1
      products.first.name
    else
      products.first.name + ' and more.'
    end
  end

  def generate_permalink
    self.permalink ||= SecureRandom.uuid
  end

  # Methods for Payola

  def name
    'nanoLODE Cart'
  end

  def redirect_path(payola_sale)
    Rails.application.routes.url_helpers.receipt_cart_url(permalink)
  end
end
