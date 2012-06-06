class Api::MenuController < Api::ApiController
  def show
    @menu = Menu.all.first

    respond_with :api, @menu, :api_template => :public
  end
end
