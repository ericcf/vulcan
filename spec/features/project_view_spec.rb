require 'spec_helper'
require 'pages/project_pages/show'

feature 'Project view' do

  include_context 'authentication helper'

  background do
    sign_in
  end

  scenario 'try to view a nonexistant project' do
    project_page = ProjectPages::Show.new(page, id: 12345).visit
    project_page.alert('error').should eq('Unable to find project, please try again.')
  end
end
