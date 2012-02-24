require 'spec_helper'

describe SessionsController do
  describe "GET create" do
    before :each do
      request.env["HTTP_REFERER"] = 'http://karma.dev'
    end

    it "should assign :person_id when passed in :person" do
      get :create, {:person => {:id => 111}}
      session[:person_id].should eq(111.to_s)
    end

    it "should assign :person_id when passed in :person_id" do
      get :create, {:person_id => 222}
      session[:person_id].should eq(222.to_s)
    end

    it "should assign :person_id when :full_name passed in :person" do
      person = mock_model(Person, :id => 100, :full_name => 'TEST NAME')
      Person.should_receive(:find_by_full_name).with('TEST NAME').and_return(person)

      get :create, {:person => {:full_name => person.full_name}}
      session[:person_id].should eq(person.id)
    end

  end
end
