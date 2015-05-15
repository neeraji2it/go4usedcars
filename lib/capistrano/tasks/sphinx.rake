namespace :sphinx do 
  p "********************************************sphinx1"
  desc "Start and index the sphinx server"
  task :start do 
    on roles(:app) do 
      within release_path do
        with rails_env: fetch(:rails_env) do
          info "sphinx indexing"
          execute :rake, "ts:index"
          p "********************************************sphinx index"
          execute :rake, "ts:start"
          p "********************************************sphinx start"
          execute :rake, "ts:rebuild"
          p "********************************************sphinx rebuild"
        end
      end
    end
  end
 after "deploy:finished", "sphinx:start"
end