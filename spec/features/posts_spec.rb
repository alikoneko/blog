require 'spec_helper'

feature "Posts" do
  feature "Guest views blog home page" do
    scenario do
      visit posts_path

      #expect(page).to have_content(post.title)
      expect(page).to have_content("it works")

    end
  end
end