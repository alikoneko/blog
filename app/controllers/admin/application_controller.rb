module Admin
  class ApplicationController < ::ApplicationController
    before_filter :ensure_admin

    private
    def ensure_admin
      redirect_to [:new, :sessions] unless current_user.present?
    end
  end
end