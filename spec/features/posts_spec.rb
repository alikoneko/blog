require 'spec_helper'

feature "Posts" do
  feature "Guest views blog home page" do
    given!(:posts) { 3.times.map { create :published_post } }

    scenario do
      visit posts_path

      posts.each do |post|
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.body)
      end
    end
  end
  feature "Guest views a single post" do
    given!(:post) { create :published_post }
    scenario do
      visit post_path(post.id)

      expect(page).to have_content(post.title)
      expect(page).to have_content(post.body)
    end
  end
  feature "Guest views archive" do
    scenario do
      visit archive_posts_path
    end
  end
end