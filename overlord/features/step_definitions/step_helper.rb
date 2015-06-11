require 'capybara'

LOCALHOST_PATH = "http://localhost:4567"
BOOT_SCREEN = LOCALHOST_PATH + "/"
ACTIVATION_SCREEN = LOCALHOST_PATH + "/activate/"
DEACTIVATION_SCREEN = LOCALHOST_PATH + "/deactivate"

$session = Capybara::Session.new(:selenium)

def go_to_boot_screen
  $session.visit(BOOT_SCREEN)
end

def click_submit
  $session.click_button("boot")
end

def check_activate_screen
  $session.has_content?("Activate your bomb")
end

def fill_in_custom_values(act_code, deact_code)
  $session.fill_in("act_code", :with => act_code)
  $session.fill_in("deact_code", :with => deact_code)
end

def check_custom_values(act_code, deact_code)
end

def fill_in_activation_code(act_code)
  $session.fill_in("act_code", :with => act_code)
end

def click_activate
  $session.click_button("activate")
end

def check_activated
  $session.has_content?("Deactivate your bomb")
end

def check_not_activated
  $session.has_content?("Activate your bomb")
end

def fill_in_deactivation_code(deact_code)
  $session.fill_in("deact_code", :with => deact_code)
end

def click_deactivate
  $session.click_button("deactivate")
end

def try_deactivating(deact_code, num_tries)
  num_tries = num_tries.to_i
  while num_tries != 0 do
    fill_in_deactivation_code(deact_code)
    click_deactivate
    check_activated
    num_tries -= 1
  end
end

def check_exploded
  $session.has_content?("shit")
end
