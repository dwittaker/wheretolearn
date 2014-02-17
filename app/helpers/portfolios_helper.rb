module PortfoliosHelper

  def currencylist

    #@currencylist = { 0 => "CAD", 1 => "EUR", 2 => "GBP", 3 => "JMD", 4 => "USD"}
    @currencylist = { "CAD" => 0, "EUR" => 1, "GBP" => 2, "JMD" => 3, "USD" => 4}
    #@currencylist = [ "CAD", "EUR", "GBP", "JMD", "USD"]
  end

end
