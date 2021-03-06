module Hydramata::Deposit
  module WorksResponder
    def self.call(*args, &block)
      Base.call(*args, &block)
    end
    class Base < ActionController::Responder

      def navigation_behavior(error)
        if get?
          raise error
        elsif has_errors? && default_action
          render :action => default_action
        else
          redirect_to(controller.hydramata_deposit.work_path(resource.to_param), { flash: { success: "Depositing #{resource}"} })
        end
      end

    end
  end
end
