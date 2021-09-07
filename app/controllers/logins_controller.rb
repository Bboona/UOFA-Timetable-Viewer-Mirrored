class LoginsController < ApplicationController
  def index
    @wrong = "no"
    @n1 = params[:user_name]
    @n2 = params[:password]

    puts "aaadwqqdqd"
    if @n1 == "xiangyu" and @n2 == "11111"
      redirect_to teachers_index_path(:name=>@n1)
    end
    if @n1 != "xiangyu" and @n2 == "11111"
      @wrong = "name"
    end
    if @n1 == "xiangyu" and @n2 != "11111"
      @wrong = "password"
    end
    if @n1 != "xiangyu" and @n2 != "11111"
      @wrong = "both"
    end
  end
end
