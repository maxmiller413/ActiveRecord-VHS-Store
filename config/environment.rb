require 'bundler/setup'
Bundler.require

# sets up connection to the database file
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3', # Postgres, MySQL, etc
  database: "db/development.sqlite"
)

# enables logging in console whenever ActiveRecord writes SQL for us
ActiveRecord::Base.logger = Logger.new(STDOUT)

# 6. You must have noticed that one of the models is called `Vhs`. In `rake console` run:
# ```ruby
# 'vhs'.pluralize
# 'vhs'.singularize
# ```
# As you see, ActiveRecord perceives this word as already pluralized and it will pose problems when you're trying to apply `.vhs` method on e.g. a `Movie` instance (AR will look for a singularized model of `Vh`). To prevent this, let's tell AR that this word is the same singular as plural -- paste this in `config/environment.rb`:
# ```ruby
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.irregular 'vhs', 'vhs'
# end

ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'vhs', 'vhs'
end

require_all 'app'