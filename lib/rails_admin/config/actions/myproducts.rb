
class Myproducts < RailsAdmin::Config::Actions::Base
  RailsAdmin::Config::Actions.register(self)
  register_instance_option :collection do
    true
  end
  register_instance_option :visible? do
    authorized?
  end
  register_instance_option :only do
    Product
  end
  register_instance_option :controller do
    proc do
      @objects = Product.with_name(params[:query])
      render :index
    end
  end
end