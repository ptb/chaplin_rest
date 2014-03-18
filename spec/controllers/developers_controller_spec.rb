require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe DevelopersController do

  # This should return the minimal set of attributes required to create a valid
  # Developer. As you add validations to Developer, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DevelopersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all developers as @developers" do
      developer = Developer.create! valid_attributes
      get :index, {}, valid_session
      assigns(:developers).should eq([developer])
    end
  end

  describe "GET show" do
    it "assigns the requested developer as @developer" do
      developer = Developer.create! valid_attributes
      get :show, {:id => developer.to_param}, valid_session
      assigns(:developer).should eq(developer)
    end
  end

  describe "GET new" do
    it "assigns a new developer as @developer" do
      get :new, {}, valid_session
      assigns(:developer).should be_a_new(Developer)
    end
  end

  describe "GET edit" do
    it "assigns the requested developer as @developer" do
      developer = Developer.create! valid_attributes
      get :edit, {:id => developer.to_param}, valid_session
      assigns(:developer).should eq(developer)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Developer" do
        expect {
          post :create, {:developer => valid_attributes}, valid_session
        }.to change(Developer, :count).by(1)
      end

      it "assigns a newly created developer as @developer" do
        post :create, {:developer => valid_attributes}, valid_session
        assigns(:developer).should be_a(Developer)
        assigns(:developer).should be_persisted
      end

      it "redirects to the created developer" do
        post :create, {:developer => valid_attributes}, valid_session
        response.should redirect_to(Developer.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved developer as @developer" do
        # Trigger the behavior that occurs when invalid params are submitted
        Developer.any_instance.stub(:save).and_return(false)
        post :create, {:developer => { "name" => "invalid value" }}, valid_session
        assigns(:developer).should be_a_new(Developer)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Developer.any_instance.stub(:save).and_return(false)
        post :create, {:developer => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested developer" do
        developer = Developer.create! valid_attributes
        # Assuming there are no other developers in the database, this
        # specifies that the Developer created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Developer.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => developer.to_param, :developer => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested developer as @developer" do
        developer = Developer.create! valid_attributes
        put :update, {:id => developer.to_param, :developer => valid_attributes}, valid_session
        assigns(:developer).should eq(developer)
      end

      it "redirects to the developer" do
        developer = Developer.create! valid_attributes
        put :update, {:id => developer.to_param, :developer => valid_attributes}, valid_session
        response.should redirect_to(developer)
      end
    end

    describe "with invalid params" do
      it "assigns the developer as @developer" do
        developer = Developer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Developer.any_instance.stub(:save).and_return(false)
        put :update, {:id => developer.to_param, :developer => { "name" => "invalid value" }}, valid_session
        assigns(:developer).should eq(developer)
      end

      it "re-renders the 'edit' template" do
        developer = Developer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Developer.any_instance.stub(:save).and_return(false)
        put :update, {:id => developer.to_param, :developer => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested developer" do
      developer = Developer.create! valid_attributes
      expect {
        delete :destroy, {:id => developer.to_param}, valid_session
      }.to change(Developer, :count).by(-1)
    end

    it "redirects to the developers list" do
      developer = Developer.create! valid_attributes
      delete :destroy, {:id => developer.to_param}, valid_session
      response.should redirect_to(developers_url)
    end
  end

end
