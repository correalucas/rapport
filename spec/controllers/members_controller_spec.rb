require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  let(:valid_attributes) {}

  let(:invalid_attributes) {}

  let(:valid_session) { {} }

  describe "GET #show" do
    it "returns a success response" do
      member = Member.create! valid_attributes
      get :show, params: {id: member.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Member" do
        expect {
          post :create, params: {member: valid_attributes}, session: valid_session
        }.to change(Member, :count).by(1)
      end

      it "redirects to the created member" do
        post :create, params: {member: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Member.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {member: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end
end
