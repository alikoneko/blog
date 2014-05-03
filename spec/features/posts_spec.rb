require 'spec_helper'

feature "Posts" do
  feature "Guest views blog home page" do
    given!(:posts) { 3.times.map { create :published_post } }

    scenario do
      visit posts_path

      posts.each do |post|
        expect(page).to have_content(post.title)
      end
    end
  end
end