class UsersController < ApplicationController
  get '/sign_up' do
    render_with_template :sign_up
  end

  post '/sign_up' do
    new_password = BCrypt::Password.create(params[:password])
    @user = User.new(password: new_password, email: params[:email])
    if @user.valid?
      @user.save
      redirect to('/sign_in')
    else
      redirect back
    end
  end

  get '/sign_in' do
    render_with_template :sign_in
  end

  post '/sign_in' do
    if @user = set_user
      password = BCrypt::Password.new(@user.password)
      if password == params[:password]
        session[:user_id] = @user.id
        redirect to(base_url)
      end
    end
    redirect back
  end

  post '/sign_out' do
    @user = set_user
    if @user
      session.delete(:user_id)
    end
    redirect back
  end

  private

  def set_user
    User.where(email: params[:email]).last
  end

  def title
    'Auth'
  end
end
