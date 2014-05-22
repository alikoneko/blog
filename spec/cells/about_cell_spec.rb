require 'spec_helper'

describe AboutCell do

  context "About Me rendering" do
    context "rendering show/about_me" do
      subject { render_cell(:about, :show) }

      it { should have_selector("h2", text: "About") }
      it { should have_selector("p") }
    end
  end

end
