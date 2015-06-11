require_relative 'step_helper'

Given(/^the bomb is booted without a custom deactivation code$/) do
  go_to_boot_screen
  click_submit
end

Given(/^the bomb is activated$/) do
  fill_in_activation_code("1234")
  click_activate
  check_activated
end

When(/^I deactivate the bomb with code (\d+)$/) do |arg1|
  fill_in_deactivation_code(arg1)
  click_deactivate
end

Then(/^the bomb will be deactivated$/) do
  check_activate_screen
end

Given(/^the bomb is booted with a deactivation code of (\d+)$/) do |arg1|
  go_to_boot_screen
  fill_in_custom_values("1234", arg1)
  click_submit
end

When(/^I deactivate the bomb with code (\d+) (\d+) times$/) do |arg1, arg2|
  try_deactivating(arg1, arg2)
end

Then(/^the bomb will still be active$/) do
  check_activated
end

Then(/^the bomb will explode$/) do
  check_exploded
end
