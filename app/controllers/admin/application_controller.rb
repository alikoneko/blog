module Admin
  class ApplicationController < ::ApplicationController
    before_filter :ensure_admin

    private
    def ensure_admin

    end
  end
end