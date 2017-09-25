# Used for ruby extensions.
Dir["#{Rails.root}/lib/ruby_ext/*.rb"].each { |file| require file }

# Used for rails extensions.
# Dir["#{Rails.root}/lib/rails_ext/*.rb"].each { |file| require file }
