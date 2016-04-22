require 'rails_helper'

RSpec.describe SnippetsController, type: :controller do

  let(:snippet) { Snippet.new(title: "title", work: "work") }

  describe "#new" do
    before { get :new }
    it "renders a new template" do
      expect(response).to render_template(:new)
    end
    it "assigns a snippet object to an instance variable" do
      expect(assigns(:snippet)).to be_a_new(Snippet)
    end
  end

  describe "#create" do
    context "with valid params" do
      def valid_request
        post :create, snippet: {title: "ruby code", work: "def method end"}
      end

      it "saves a record to the database" do
        expect { valid_request }.to change { Snippet.count }.by(1)
      end
      it "redirects to the snippet show page" do
        valid_request
        expect(response).to redirect_to(snippet_path(Snippet.last))
      end
      it "sets a flash message" do
        valid_request
        expect(flash[:notice]).to be
      end
    end

    context "without valid params" do
      def invalid_request
        post :create, snippet: { title: nil, work: nil }
      end
      it "renders the new template" do
        invalid_request
        expect(response).to render_template(:new)
      end
      it "doesn't save a record to the database" do
        expect{ invalid_request }.to change{ Snippet.count }.by(0)
      end
    end

  end

  describe "#edit" do
    s = Snippet.new(title: "valid title", work: "valid work")
    s.save
    before { get :edit, id: s.id }
    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end
    it "sets an instance variable to the passed id" do
      expect(assigns(:snippet)).to eq(s)
    end
  end

  describe "#update" do
    context "with valid params" do
      let(:new_valid_work) { Faker::Hipster.paragraph }
      it "updates the record with the passed id" do
        patch :update, id: snippet.id, snippet: {work: new_valid_work}
        expect(snippet.reload.work).to eq(new_valid_work)
      end
      it "redirects to the show page" do
        expect(response).to redirect_to(snippet_path(snippet))
      end
      it "sets a flash message" do
        expect(flash[:notice]).to be
      end
    end
    # context "without valid params" do
    #   it "doesn't update the record of the passed id" do
    #
    #   end
    #   it "renders the edit template" do
    #
    #   end
    #
    # end
  end

  describe "#show" do
    snippet = Snippet.new(title: "title", work: "work")
    snippet.save
    before do
      get :show, id: snippet.id
    end

    it "renders the show template" do
      expect(response).to render_template(:show)
    end

    it "sets a snippet instance variable" do
      expect(assigns(:snippet)).to eq(snippet)
    end
  end

  describe "#index" do
    it "renders the index page" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns an instance variable to all snippets in the database" do
      s1 = Snippet.new(title: "valid title", work: "valid work")
      s2 = Snippet.new(title: "valid title2", work: "valid work2")
      s1.save
      s2.save
      get :index
      # What's the better way to do this? FactoryGirl? getting DB errors
      expect(assigns(:snippets)).to eq([s1, s2])
    end
  end

end

#redcarpet
#coderay
