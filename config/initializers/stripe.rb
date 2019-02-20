# For now there is no need to use the live 'real' API.
# Test is enough, however initializer has conditional flow control already settled
# to accept both scenarios.
if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV["STRIPE_PUBLISHABLE_KEY_DEV"],
    secret_key: ENV["STRIPE_SECRET_KEY_DEV"]
  }
else
  Rails.configuration.stripe = {
    publishable_key: ENV["STRIPE_PUBLISHABLE_KEY_DEV"],
    secret_key: ENV["STRIPE_SECRET_KEY_DEV"]
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
