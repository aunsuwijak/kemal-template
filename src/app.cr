require "kemal"
require "sentry-run"

get "/" do
	"Hello, World"
end

# Enable hot-reloading to kemal server
process = Sentry.config(
  process_name: "App",
  build_command: "crystal",
  run_command: "./bin/app",
  build_args: ["build", "src/app.cr", "-o", "bin/app"],
  run_args: ["-p", "9000"])

Sentry.run(process) do
  Kemal.run
end
