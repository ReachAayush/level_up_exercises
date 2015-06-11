class Bomb
  attr_accessor :status
  
  #possible states: off, inactive, activated, exploded

  def initialize
    @status = "off"
    @failed_deactivate_tries = 0
    @activation_code = ""
    @deactivation_code = ""
  end

  def set_codes(act_code, deact_code)
    @activation_code = act_code!="" ? act_code : "1234"
    @deactivation_code = deact_code!="" ? deact_code : "0000"
    fail RuntimeError, "Numeric Codes Only" unless confirm_numeric
  end

  def confirm_numeric
    /^[0-9]{4}$/.match(@activation_code) && /^[0-9]{4}$/.match(@deactivation_code)
  end

  def activate_bomb(code)
    if @status == "inactive"
      @status = @activation_code == code ? "active" : "inactive"
    end
  end

  def deactivate_bomb(code)
    if @status == "active"
      @status = @deactivation_code == code ? "inactive" : "active"
      @failed_deactivate_tries += 1 unless @status == "inactive"
      explode_bomb if @failed_deactivate_tries == 3
    end
  end

  def boot(act_code = "", deact_code = "")
    fail RuntimeError, "bomb not currently off" unless @status == "off"
    set_codes(act_code, deact_code)
    @status = "inactive"
  end

  def explode_bomb
    @status = "exploded"
  end
end
