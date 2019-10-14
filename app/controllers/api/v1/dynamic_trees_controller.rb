module Api
  module V1
    class DynamicTreesController < ActionController::API
      before_action :set_dynamic_tree, except: [:show]

      def show
        @root = DynamicTree.roots.find params[:id]
        
        render json: @root.to_structured_tree
      end

      def parent
        render json: @dynamic_tree.parent_id
      end

      def children
        render json: @dynamic_tree.children.pluck(:id)
      end

      private

      def set_dynamic_tree
        @dynamic_tree = DynamicTree.find params[:id]
      end
    end
  end
end
