namespace :sphinx do 
  desc "Start and index the sphinx server"
  task :start do 
    on roles(:app) do 
      within release_path do
        with rails_env: fetch(:rails_env) do
          info "sphinx indexing"
          execute :rake, "ts:index"
          execute :rake, "ts:rebuild"
        end
      end
    end
  end
 after "deploy:finished", "sphinx:start"
end