class Api::MenuController < Api::ApiController
  def show
    @menu = Menu.all.first

    respond_with @menu, :api_template => :public
  end
end
