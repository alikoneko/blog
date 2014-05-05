require 'spec_helper'

feature "posts" do

  feature "Guest views blog home page" do
    given!(:posts) { 3.times.map { create :published_post, tag_list: "tagz"  } }

    scenario do
      visit posts_path

      posts.each do |post|
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.body)
        expect(page).to have_content(post.tag_list)
      end
    end
  end

  feature "Guest views a single post" do
    given!(:post) { create :published_post, tag_list: "tagz" }

    scenario do

      visit post_path(post.id)

      expect(page).to have_content(post.title)
      expect(page).to have_content(post.body)
      expect(page).to have_content(post.tag_list)
    end
  end

  feature "Guest views archive" do
    given!(:posts) { 3.times.map { create :published_post, tag_list: "tagz"  } }
    scenario do
      visit archive_posts_path

      posts.each do |post|
        expect(page).to have_content(post.title)
      end
    end
  end
end