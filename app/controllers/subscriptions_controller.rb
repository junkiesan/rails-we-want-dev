class SubscriptionsController < ApplicationController
  def choose_plan
    plan = params[:plan]
    @subscription = current_user.subscription
    if @subscription.present? && @subscription.update(plan: plan)
    else
    end
  end
end
