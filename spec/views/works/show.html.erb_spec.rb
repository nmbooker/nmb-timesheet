require 'spec_helper'

describe "works/show" do
  before(:each) do
    @work = assign(:work, stub_model(Work,
      :project_id => "",
      :activity_id => "",
      :minutes => "",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/MyText/)
  end
end
