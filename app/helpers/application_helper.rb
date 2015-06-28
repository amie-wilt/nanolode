module ApplicationHelper

  def format_money(cents)
    number_to_currency(cents / 100.0)
  end
end
