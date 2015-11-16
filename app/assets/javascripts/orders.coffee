jQuery ->
  Stripe.setPublishableKey('pk_test_8YZSk6eTzxcwHYqAoZCxXgwh')
  order.placeOrderForm()
  
 order =
  placeOrderForm: ->
    $('#new_order').submit ->
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        order.processCard()
        false
      else
        true

  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      exp_month: $('#card_month').val()
      exp_year: $('#card_year').val()
    last_four = card.number.substr(card.number.length - 4)
    $('#last_four').val(last_four)
    Stripe.createToken(card, order.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#order_stripe_card_token').val(response.id)
      $('#new_order')[0].submit()
    else
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)
