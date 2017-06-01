require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions
      class Stats < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :root? do
          true
        end

        register_instance_option :breadcrumb_parent do
          nil
        end

        register_instance_option :controller do
          proc do
            @top_selling = {}
            @top_sell_by_man = {}
            @top_sell_by_country = {}
            completed = OrderProduct
                       .joins(:order)
                       .where(orders: { order_status_id: 4 })

            completed.each do |ord_prod|
              man_name = ord_prod.product.manufacturer.name
              full_name = man_name + ' ' + ord_prod.product.name
              country_name = ord_prod.order.user.country.name

              old = @top_selling[full_name]
              old_man = @top_sell_by_man[man_name]
              old_country = @top_sell_by_country[country_name]

              if old.nil?
                old = 0
              end

              if old_man.nil?
                old_man = 0
              end

              if old_country.nil?
                old_country = 0
              end

              q = ord_prod.quantity
              @top_sell_by_man.merge!( { man_name => old_man + q })
              @top_selling.merge!({ full_name => old + q })
              @top_sell_by_country.merge!({ country_name => old_country + q})
            end

            @least_selling = @top_selling.sort_by {|k, v| v }.first(15)
            @top_selling = @top_selling.sort_by {|k,v| v}.reverse.first(15)
            @top_sell_by_man = @top_sell_by_man.sort_by { |k, v| v }.reverse.first(10)
            @top_sell_by_country = @top_sell_by_country.sort_by { |k, v| v}.reverse.first(15)

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