require 'spec_helper'

feature "admin/posts" do
  feature "ali views blog home page" do
    given!(:posts) { 3.times.map { create :published_post } }

    scenario do
      visit admin_posts_path

      posts.each do |post|
        expect(page).to have_content(post.title)
      end
    end
  end

  feature "ali views a single post" do
    given!(:post) { create :published_post }

    scenario do

      visit admin_post_path(post.id)

      expect(page).to have_content(post.title)
      expect(page).to have_content(post.body)
    end
  end
end