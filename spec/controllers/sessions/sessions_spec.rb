require 'spec_helper'

describe SessionsController do
  context "without a logged in user" do
    describe "#new" do
      it "assigns new @session_form" do
        get :new

        expect(assigns(:session_form)).to be_present
      end
    end

    describe "#create" do
      let(:user) { create :user }

      context "with valid credentials" do
        it "assigns the user id to the current session " do
          post :create, session_form: { email: user.email, password: user.password }

          expect(session[:user_id]).to eq(user.id)
        end
      end

      context "without valid credentials" do
        it "assigns the @session_form" do
          post :create, session_form: { email: user.email, password: "tits" }

          expect(assigns(:session_form)).to be_present
        end
      end
    end


  end
end
