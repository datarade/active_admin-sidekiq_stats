Gem::Specification.new do |s|
  s.name = 'active_admin-sidekiq_stats'
  s.version = '0.0.2'
  s.licenses = ['MIT']
  s.date = '2019-07-12'
  s.summary = 'Active Admin component to display Sidekiq statistics.'
  s.authors = 'Datarade'
  s.files = [
    'lib/active_admin-sidekiq_stats.rb',
    'lib/active_admin/sidekiq_stats.rb'
  ]
  s.require_paths = ['lib']

  s.add_runtime_dependency 'arbre', '>= 1.1.1'
  s.add_runtime_dependency 'sidekiq', '>= 5.0.0'
end
