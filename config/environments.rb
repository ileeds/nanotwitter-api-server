# These Settings Establish the Proper Database Connection for Heroku Postgres
# The environment variable DATABASE_URL should be in the following format:
#     => postgres://{user}:{password}@{host}:{port}/path
# This is automatically configured on Heroku, you only need to worry if you also
# want to run your app locally

require 'zlib'

configure :production do
  puts "Starting up nanoTwitter..."
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/production')
  ActiveRecord::Base.establish_connection(
      :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
      :host     => db.host,
      :username => db.user,
      :password => db.password,
      :database => db.path[1..-1],
      :encoding => 'utf8'
  )
end

configure :development, :test do
  puts "Starting development or test"
end

=begin
configure :development do
  puts "Starting up nanoTwitter..."
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/development')
  ActiveRecord::Base.establish_connection(
      :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
      :host     => db.host,
      :username => db.user,
      :password => db.password,
      :database => db.path[1..-1],
      :encoding => 'utf8'
  )
end

configure :test do
  puts "[Testing, Testing 1 2 3]"
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/test')

  ActiveRecord::Base.establish_connection(
      :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
      :host     => db.host,
      :username => db.user,
      :password => db.password,
      :database => db.path[1..-1],
      :encoding => 'utf8'
  )
end
=end

=begin
configure :development, :test do
  puts "[Starting up nanoTwitter]"
  db = URI.parse(ENV['DATABASE_URL'] || 'mysql://localhost/mydb')
end
=end
