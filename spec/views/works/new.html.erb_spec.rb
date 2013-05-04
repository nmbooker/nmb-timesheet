require 'spec_helper'

describe "works/new" do
  before(:each) do
    assign(:work, stub_model(Work,
      :project_id => "",
      :activity_id => "",
      :minutes => "",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new work form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", works_path, "post" do
      assert_select "input#work_project_id[name=?]", "work[project_id]"
      assert_select "input#work_activity_id[name=?]", "work[activity_id]"
      assert_select "input#work_minutes[name=?]", "work[minutes]"
      assert_select "textarea#work_description[name=?]", "work[description]"
    end
  end
end
