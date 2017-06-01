require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions
      class Shipped < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :root? do
          true
        end

        register_instance_option :breadcrumb_parent do
          nil
        end

        register_instance_option :controller do
          proc do
            @orders = Order.all.where(order_status_id: 3).order(:updated_at).reverse

            render @action.template_name, status: 200
          end
        end

        register_instance_option :link_icon do
          'hand-up'
        end

        register_instance_option :pjax do
          false
        end

        register_instance_option :statistics? do
          false
        end
      end
    end
  end
end