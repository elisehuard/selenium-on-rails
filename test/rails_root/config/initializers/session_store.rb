# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rails_root_session',
  :secret      => 'f929ada6b9f725ae64ec8d1a676c386b82c1b9c9f9f5f200a5f4a69b02c3e3916a1e28afa6d3b1ca4af27aeb7e9bc36788bf35b4a59c2d5e33b754ecd8fdbceb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
