require 'spec_helper'

describe "cources/new.html.erb" do
  before(:each) do
    assign(:cource, stub_model(Cource,
      :name => "MyString",
      :question => nil,
      :created_by => 1
    ).as_new_record)
  end

  it "renders new cource form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cources_path, :method => "post" do
      assert_select "input#cource_name", :name => "cource[name]"
      assert_select "input#cource_question", :name => "cource[question]"
      assert_select "input#cource_created_by", :name => "cource[created_by]"
    end
  end
end
