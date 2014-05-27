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
#TODO test the functionality of it having posts. ask james about this
#TODO ask if I should just have a mailto or a contact me page...leaning more towards the form, but want a 2nd opinion.