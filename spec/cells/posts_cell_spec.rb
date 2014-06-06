require 'spec_helper'

describe PostsCell do

  context "Posts Cells rendering" do


    context "rendering/recent posts" do

      subject{ render_cell(:posts, :recent) }

      it { should have_selector("h2", text:"Recent Posts") }

    end

    context "rendering/tag cloud" do

      subject{ render_cell(:posts, :tag_cloud) }

      it { should have_selector("h2", text:"Tags")}

    end
  end

end