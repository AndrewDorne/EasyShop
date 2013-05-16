class ApplicationController < ActionController::Base
  protect_from_forgery

  # if user is logged in, return current_user, else return guest_user
  def current_or_guest_user
    if current_user
      if session[:guest_user_id]
        logging_in
        guest_user.destroy
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  # find guest_user object associated with the current session,
  # creating one as needed
  def guest_user
    # Cache the value the first time it's gotten.
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
    session[:guest_user_id] = nil
    guest_user
  end

  helper_method :current_cart

  private

    # called (once) when the user logs in, insert any code your application needs
    # to hand off from guest_user to current_user
    # TODO: Implement with items
    def logging_in
      guest_items = guest_user.line_items.all
      guest_items.each do |item|
        item.user_id = current_user.id
        item.save!
      end
    end

    def create_guest_user
      u = User.create(:first_name => "guest", :email => "guest_#{Time.now.to_i}#{rand(99)}@example.com")
      u.save(:validate => false)
      session[:guest_user_id] = u.id
      u
    end

    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
end
