require 'spec_helper'

describe "cources/edit.html.erb" do
  before(:each) do
    @cource = assign(:cource, stub_model(Cource,
      :name => "MyString",
      :question => nil,
      :created_by => 1
    ))
  end

  it "renders the edit cource form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cources_path(@cource), :method => "post" do
      assert_select "input#cource_name", :name => "cource[name]"
      assert_select "input#cource_question", :name => "cource[question]"
      assert_select "input#cource_created_by", :name => "cource[created_by]"
    end
  end
end
