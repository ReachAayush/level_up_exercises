require_relative 'step_helper.rb'

Given(/^I am on the boot screen$/) do 
  go_to_boot_screen
end

When(/^the bomb is booted with default codes$/) do
  click_submit
end

Then(/^The bomb should be ready to be activated$/) do
  check_activate_screen
end

When(/^the bomb is booted with activation code (\d+) and deactivation code (\d+)$/) do |arg1, arg2|
  fill_in_custom_values(arg1, arg2)
  click_submit
end

Then(/^the bomb should be ready to be activated with the code (\d+) and deactivated with the code (\d+)$/) do |arg1, arg2|
  check_custom_values(arg1, arg2)
  check_activate_screen
end
