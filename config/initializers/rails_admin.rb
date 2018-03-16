RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)

  ## == Authorization without CanCanCan ==
    config.authorize_with do
      redirect_to main_app.root_path unless current_user.is_admin?
    end

     config.model Product do

       object_label_method do
         :full_name
       end


       list do
         field :id
         field :full_name
         field :description
         field :price
       end

       field :full_name do
         searchable :full_name
       end


       edit do
         field :name
         field :manufacturer
         field :price
         field :description, :wysihtml5 do
           config_options toolbar: { fa: true }, # use font-awesome instead of glyphicon
                          html: true, # enables html editor
                          parserRules: { tags: { p:1 } } # support for <p> in html mode
         end
         field :release_date
         field :chipset
         field :display_resolution
         field :display_size
         field :ram
         field :storage
         field :rear_camera
         field :front_camera
         field :product_images, :simple_has_many do

         end
       end
     end


     config.model Order do
       edit do
         field :total
         field :order_status
         field :user
         field :order_products, :simple_has_many do

         end
       end
     end

     config.model User do
       object_label_method do
         :custom_label_method
       end

       edit do
         field :email
         field :password
         field :first_name
         field :last_name
         field :address
         field :city
         field :postal_code
         field :country
         field :is_admin
         field :orders, :simple_has_many
       end
     end

     config.model ProductImage do
       object_label_method do
         :custom_label_method
       end

       edit do
         field :image
         field :img_order
       end
     end

     config.model OrderProduct do
       object_label_method do
         :custom_label_method
       end
     end

   config.model 'Review' do
     visible false
   end

   config.model 'ProductImage' do
     visible false
   end

   config.model 'Chipset' do
     visible false
   end

   config.model 'DisplayResolution' do
     visible false
   end

   config.model 'DisplaySize' do
     visible false
   end

   config.model 'FrontCamera' do
     visible false
   end

   config.model 'RearCamera' do
     visible false
   end

   config.model 'Manufacturer' do
     visible false
   end

   config.model 'Ram' do
     visible false
   end

   config.model 'Storage' do
     visible false
   end

   config.model 'OrderProduct' do
     visible false
   end

   config.model 'OrderStatus' do
     visible false
   end

   config.model 'Country' do
     visible false
   end


  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    require_relative '../../lib/rails_admin/config/actions/dashboard'
    dashboard
    require_relative '../../lib/rails_admin/config/actions/shipped'
    shipped
    require_relative '../../lib/rails_admin/config/actions/reviews'
    reviews
    require_relative '../../lib/rails_admin/config/actions/stats'
    stats
    require_relative '../../lib/rails_admin/config/actions/myproducts'

    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end

