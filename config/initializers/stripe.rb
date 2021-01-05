Rails.configuration.stripe = { 
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key:      ENV['STRIPE_SECRET_KEY'],
  signing_secret:  ENV['STRIPE_WEBHOOK_SECRET_KEY']
 }

 Stripe.api_key = Rails.configuration.stripe[:secret_key]
 StripeEvent.signing_secret = Rails.configuration.stripe[:signing_secret]

 StripeEvent.configure do |events|
  events.subscribe 'charge.failed' do |event|
    event.class       #=> Stripe::Event
    event.type        #=> "charge.failed"
    event.data.object #=> #<Stripe::Charge:0x3fcb34c115f8>
  end

  events.subscribe 'charge.succeeded' do |event|
    event.class       #=> Stripe::Event
    event.type        #=> "charge.succeeded"
    data = event.data.object

    puts "Amount: #{data.amount}"
    puts "Description: #{data.description}"

    if data.paid
      # extend account access
      
    end
  end
 end
 
