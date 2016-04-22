require 'rails_helper'

RSpec.describe SnippetsController, type: :controller do

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

  # describe "#update" do
  #   context "with valid params" do
  #
  #     before do
  #       valid_work2 = "valid work 2"
  #       s = Snippet.new(title: "valid title", work: "valid work")
  #       s.save
  #       patch :update, id: s.id, s: {work: valid_work2}
  #     end
  #
  #     it "updates the record with the passed id" do
  #       expect(s.reload.work).to eq(valid_work2)
  #     end
  #     # it "redirects to the show page" do
  #     #   expect(response).to redirect_to(snippet_path(s))
  #     # end
  #     # it "sets a flash message" do
  #     #   expect(flash[:notice]).to be
  #     # end
  #   end
  #   # context "without valid params" do
  #   #   it "doesn't update the record of the passed id" do
  #   #
  #   #   end
  #   #   it "renders the edit template" do
  #   #
  #   #   end
  #   #
  #   # end
  # end

  # describe "#show" do
  #   before do
  #     get :show, id: snippet.id
  #   end
  #
  #   it "renders the show template" do
  #     expect(response).to render_template(:show)
  #   end
  #
  #   it "sets a product instance variable" do
  #     expect(assigns(:snippet)).to eq(snippet)
  #   end
  # end
  # describe "#index"

end

#redcarpet
#coderay
