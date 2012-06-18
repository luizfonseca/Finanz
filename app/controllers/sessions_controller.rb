class SessionsController < ApplicationController
  def create
    info = request.env['omniauth.auth']['info']
    session[:user_id] = User.find_or_create_by_email(info['email'], :first_name => info['first_name'], :last_name => info['last_name']).id
    redirect_to transactions_path
  end

  def new
  end
end
