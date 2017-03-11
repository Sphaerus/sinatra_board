class BoardsController < AdminController
  get '/' do
    @boards = Board.all
    render_with_template('/admin/boards/index')
  end

  get '/new' do
    render_with_template('/admin/boards/new')
  end

  post '/new' do
    @board = Board.new(params[:board_attributes])
    if @board.save
      redirect to('/')
    else
      redirect back
    end
  end

  get '/:id/edit' do
    set_board
    render_with_template('/admin/boards/edit')
  end

  post '/:id' do
    set_board
    if @board.update_attributes!(params[:board_attributes])
      redirect to('/')
    else
      redirect back
    end
  end

  post '/:id/delete' do
    set_board
    @board.destroy
    redirect to('/')
  end

  private

  def title
    'Boards'
  end

  def authenticate_admin
    authenticate_user
    redirect to(base_url) if !current_user.admin?
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
