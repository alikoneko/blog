require 'spec_helper'

describe SessionsController do
  context "without a logged in user" do
    describe "#new" do
      it "assigns new @session_form" do
        get :new

        expect(assigns(:session_form)).to be_present
      end
    end

  end
end
