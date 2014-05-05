require 'spec_helper'

feature "admin/posts" do

  feature "ali views blog home page" do
    given!(:posts) { 3.times.map { create :published_post, tag_list: "tagged"  } }

    scenario do
      visit admin_posts_path

      posts.each do |post|
        expect(page).to have_content(post.title)
      end
    end
  end

  feature "ali views a single post" do
    given!(:post) { create :published_post, tag_list: "tagged"  }

    scenario do

      visit admin_post_path(post.id)

      expect(page).to have_content(post.title)
      expect(page).to have_content(post.body)
      expect(page).to have_content(post.tag_list)
    end
  end

  feature "ali adds a new post" do
    scenario do
      visit new_admin_post_path

      fill_in :post_title, with: "testes"
      fill_in :post_body, with: "testicles"
      fill_in :post_tag_list, with: "toasties"

      click_button :submit_post

      expect(page).to have_content("Post submitted")
    end
  end

  feature "ali edits a post" do
    given!(:post) { create :published_post, tag_list: "tagged" }
    scenario do
      visit edit_admin_post_path(post.id)

      fill_in :post_title, with: "edited post"
      fill_in :post_body, with: "\n\nedited!"
      fill_in :post_tag_list, with: ",tested"

      select "Published", from: :post_status

      click_button :submit_post

      expect(page).to have_content("Post edited")
    end
  end

end