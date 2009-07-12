# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cucumber_101_app_session',
  :secret      => '8e917d43128498ebc68007d46e66d0daf0f1072f913244a9c689bcedf8a55196e9601b1d834a9b61ec80c44b19ed70d8512c010fbc04a2dfd3b98c09795d3a9f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
