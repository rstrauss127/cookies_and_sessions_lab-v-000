class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def cart
    session[:cart] ||= []
  end

  def add_to_cart
    #get item from the path POST /items/:id/add_to_cart
    @item = Item.find(params[:id])

    #Load the cart from the session, or creat a new empty one
    cart = session[:cart] || []
    cart << @item.id

    #save the cart in the session
    session[:cart] = cart
  end
end
