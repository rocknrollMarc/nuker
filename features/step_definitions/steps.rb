Given /^a feature file named "([^"]*)" with the contents:$/ do |filename, contents|
  @contents = contents
  create_feature("project", filename, @contents)
end

When /^I visit the project page$/ do
  visit "/projects/project"
end

When /^I visit the sample feature page$/ do
  visit "/projects/project/features/sample-feature"
end

When /^I select "([^"]*)"$/ do |text|
  click_link text
end

Then /^I see a link to "([^"]*)" with the url "([^"]*)"$/ do |text, url|
  page.should have_link text, :href => url
end

Then /^I see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^the total tag count is displayed$/ do
  save_and_open_page
end

Then /^I see each tag has an individual colour$/ do
 find('a.tag-tag1').should be_visible
 find('a.tag-tag2').should be_visible
 find('a.tag-tag3').should be_visible
end

