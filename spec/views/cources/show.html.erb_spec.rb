require 'spec_helper'

describe "cources/show.html.erb" do
  before(:each) do
    @cource = assign(:cource, stub_model(Cource,
      :name => "Name",
      :question => nil,
      :created_by => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
