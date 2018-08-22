require 'rails_helper'

describe NavPresenter do
  let(:view_context) { double(:view_context) }

  describe "#render_nav" do
    context "user" do
      let(:user) { double(:user) }
      let(:user_nav) { File.read("#{Rails.root}/app/views/layouts/_user_nav.html.erb") }

      it "renders navbar for users" do
        presenter = described_class.new(user, view_context)
        allow(user).to receive(:is_a?).with(User).and_return(true)
        allow(view_context).to receive(:render).with("layouts/user_nav").and_return(user_nav)

        expect(presenter.render_nav).to eq user_nav
      end
    end

    context "admin" do
      let(:admin) { double(:admin) }
      let(:admin_nav) { File.read("#{Rails.root}/app/views/layouts/_admin_nav.html.erb") }

      it "renders navbar for admins" do
        presenter = described_class.new(admin, view_context)
        allow(admin).to receive(:is_a?).with(User).and_return(false)
        allow(view_context).to receive(:render).with("layouts/admin_nav").and_return(admin_nav)

        expect(presenter.render_nav).to eq admin_nav
      end
    end
  end
end

