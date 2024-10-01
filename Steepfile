D = Steep::Diagnostic

strict_paths = [ "app/models" ]

target :app do
  signature "sig"
  check "app", "lib"
  ignore(*strict_paths)

  configure_code_diagnostics(D::Ruby.lenient)
end

target :strict do
  signature "sig"

  check(*strict_paths)

  configure_code_diagnostics(D::Ruby.strict)
end
