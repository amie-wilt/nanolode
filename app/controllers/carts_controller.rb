class CartsController < ApplicationController

  def show
    redirect_to(root_path) unless current_cart
    @cart = current_cart
  end

  def update
    product = Product.find(params[:product_id])
    line = current_cart.line_items.find_or_create_by(:product => product)

    if params[:quantity]
      if params[:quantity] == "0"
        line.destroy
        redirect_to cart_path, :notice => "#{product.name} removed from cart."
      else
        line.update(:quantity => params[:quantity])
        redirect_to cart_path, :notice => "#{product.name} quantity changed in cart."
      end
    else
      line.increment!(:quantity)
      redirect_to root_path, :notice => "#{product.name} added to cart."
    end
  end

  def receipt
    session[:cart_id] = nil
    @cart = Cart.find_by(permalink: params[:id])
    redirect_to(root_path) unless @cart
    @sale = Payola::Sale.find_by(product_id: @cart.id)
  end

  private

  def current_cart
    @current_cart ||= (super || Cart.create!.tap { |c| session[:cart_id] = c.id })
  end
end
