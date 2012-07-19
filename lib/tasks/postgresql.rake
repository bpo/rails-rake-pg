namespace "db:cluster" do
  desc "Create a new postgresql database cluster in RAILS_ROOT/db/postgresql directory."
  task :create => "db:load_config" do
    db_dir = File.join(Rails.root, 'db', 'postgresql')

    config = ActiveRecord::Base.configurations[Rails.env]

    unless config['username']
      raise "Please specify a username in database.yml"
    end

    pass_config = if config["password"]
      password_file = Tempfile.new('pword')
      password_file.write config["password"]
      password_file.flush

      "--pwfile=#{password_file.path}"
    end

    command = %{initdb -D #{db_dir} -U #{config["username"]} #{pass_config}}
    sh command do |ok, result|
      ok or fail "Command failed with status (#{result.exitstatus}): [#{command}]"
    end
  end

  desc "Run the local postgresql database cluster"
  task :run => "db:load_config" do
    config = ActiveRecord::Base.configurations[Rails.env]
    port = config['port'] ? "-p #{config['port']}" : ""
    exec "postgres #{port} -D ./db/postgresql"
  end
end
