class SessionsController < ApplicationController
  def new
    @session_form = SessionForm.new
  end

  def create
    @session_form = SessionForm.new(session_form_params)

    if @session_form.valid?
      user = User.find_by_email(@session_form.email).try(:authenticate, @session_form.password)

      if user
        self.current_user = user
        return redirect_to [:admin, :posts]
      end
    end

    render :new
  end

  def destroy
    self.current_user = nil
    redirect_to [:posts]
  end

  private
  def session_form_params
    params.require(:session_form).permit(:email, :password)
  end
end