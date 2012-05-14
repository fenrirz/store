class HelloWorldController < ApplicationController
  def index
  end
  
  def hello
    render :text => "<h3>Hello World</h3>"
  end

  def hello_world
    @hello = "Hello World"
  end
end
