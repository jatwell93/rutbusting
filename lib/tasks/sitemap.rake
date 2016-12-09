namespace :sitemap do
  desc 'Ping Google to let them know something has changed.'
  task ping: :environment do
    puts Sitemap.new.ping
  end
end