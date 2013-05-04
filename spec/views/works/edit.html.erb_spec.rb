require 'spec_helper'

describe "works/edit" do
  before(:each) do
    @work = assign(:work, stub_model(Work,
      :project_id => "",
      :activity_id => "",
      :minutes => "",
      :description => "MyText"
    ))
  end

  it "renders the edit work form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", work_path(@work), "post" do
      assert_select "input#work_project_id[name=?]", "work[project_id]"
      assert_select "input#work_activity_id[name=?]", "work[activity_id]"
      assert_select "input#work_minutes[name=?]", "work[minutes]"
      assert_select "textarea#work_description[name=?]", "work[description]"
    end
  end
end
