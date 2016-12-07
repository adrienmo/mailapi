use Mix.Releases.Config,
    # This sets the default release built by `mix release`
    default_release: :default,
    # This sets the default environment used by `mix release`
    default_environment: :prod

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html


# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"oXmR^{A3~Z%DU,W5P~)uDa@4U^t=0@[Vjm/eIZ&`NhCcrP;)W!9W`>vd]PFU7N{i"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set include_system_libs: true
  set cookie: :"LOMZ;E6{@%OlVv^GN`Zf:E.aEG7@^d/OJTkn}4%YKQ=7~op~=R1I%[>6I,azITy_"
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :mailapi do
  set version: current_version(:mailapi)
end
