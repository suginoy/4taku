require 'spec_helper'

describe "cources/index.html.erb" do
  before(:each) do
    assign(:cources, [
      stub_model(Cource,
        :name => "Name",
        :question => nil,
        :created_by => 1
      ),
      stub_model(Cource,
        :name => "Name",
        :question => nil,
        :created_by => 1
      )
    ])
  end

  it "renders a list of cources" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
