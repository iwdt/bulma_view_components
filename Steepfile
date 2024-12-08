D = Steep::Diagnostic

target :lib do
  collection_config "rbs_collection.yaml"

  signature "sig"

  check "lib"
  check "app"

  configure_code_diagnostics(D::Ruby.strict) do |hash|
    # hash[D::Ruby::NoMethod] = nil
  end
end
