require_relative 'step_helper'

Given(/^the bomb has been booted with activation code (\d+)$/) do |arg1|
  go_to_boot_screen
  fill_in_custom_values(arg1, "1234")
  click_submit
  check_activate_screen
end

When(/^I enter the activation code (\d+)$/) do |arg1|
  fill_in_activation_code(arg1)
  click_activate
end

Then(/^the bomb will be activated$/) do
  check_activated
end

Then(/^the bomb will not be activated$/) do
  check_not_activated
end
