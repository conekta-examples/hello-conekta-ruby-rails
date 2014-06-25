class CheckoutsController < ApplicationController
  def index
  end

  def charge
    begin
      @charge = Conekta::Charge.create({
        amount: params['chargeInCents'],
        currency: "MXN",
        description: "Pizza Delivery at #CPMX5",
        reference_id: "001-id-CPMX5",
        card: params['conektaTokenId']
      })
    rescue Conekta::ValidationError => e
      puts e.message
      #alguno de los parámetros fueron inválidos
    rescue Conekta::ProcessingError => e
      puts e.message
      #la tarjeta no pudo ser procesada
    rescue Conekta::Error
      puts e.message
      #un error ocurrió que no sucede en el flujo normal de cobros como por ejemplo un auth_key incorrecto
    end
  end
end
