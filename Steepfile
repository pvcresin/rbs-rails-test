D = Steep::Diagnostic

target :app do
  signature "sig"

  check "app"
  check "lib"
  # configure_code_diagnostics(D::Ruby.strict)       # `strict` diagnostics setting
  configure_code_diagnostics(D::Ruby.lenient)      # `lenient` diagnostics setting
  # configure_code_diagnostics(D::Ruby.silent)       # `silent` diagnostics setting
  # configure_code_diagnostics do |hash|             # You can setup everything yourself
  #   hash[D::Ruby::NoMethod] = :information
  # end
end
