# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fanrank_session',
  :secret      => 'f5a46439b9b40c9362de838653f7ecb8a3c6bea2d498d8a090c9b395b34a88fdc00d571a2cab6e479f53642e660927451a367f6631aa8e83de7e497c1f633e09'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
