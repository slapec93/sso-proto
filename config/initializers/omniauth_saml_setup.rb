# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :saml,
#     :assertion_consumer_service_url     => "http://localhost:3010/users/auth/saml/callback",
#     :issuer                             => "SSO proto",
#     :idp_sso_target_url                 => "https://bitrise.okta.com/app/bitrise_ssoproto_1/exk561rk8B7TnmiP5356/sso/saml",
#     :idp_cert                           => "-----BEGIN CERTIFICATE-----\nMIIDnjCCAoagAwIBAgIGAWcWrR9eMA0GCSqGSIb3DQEBCwUAMIGPMQswCQYDVQQGEwJVUzETMBEG\nA1UECAwKQ2FsaWZvcm5pYTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzENMAsGA1UECgwET2t0YTEU\nMBIGA1UECwwLU1NPUHJvdmlkZXIxEDAOBgNVBAMMB2JpdHJpc2UxHDAaBgkqhkiG9w0BCQEWDWlu\nZm9Ab2t0YS5jb20wHhcNMTgxMTE1MDkyMDQzWhcNMjgxMTE1MDkyMTQzWjCBjzELMAkGA1UEBhMC\nVVMxEzARBgNVBAgMCkNhbGlmb3JuaWExFjAUBgNVBAcMDVNhbiBGcmFuY2lzY28xDTALBgNVBAoM\nBE9rdGExFDASBgNVBAsMC1NTT1Byb3ZpZGVyMRAwDgYDVQQDDAdiaXRyaXNlMRwwGgYJKoZIhvcN\nAQkBFg1pbmZvQG9rdGEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0ehQ8joU\nf7ZZn6iofRR3wyd8DmiDD5+1GBR6Q/Q6BRzce2ZYPTIVPq9d0FDxaZdRqo83Uqyk1LVk5E7YAQ6G\nOImUxKHZj3Fajhvmes5sbF1/QVxDqLt2TfZSIxBDJGLlMbjYPdHS+CL7CW1Gge/lEAiDDwOLTfES\nWoyXhsouYmhDitn1/E1o6WykIh7Tqs12gIPuuprRj1cji97MSbdJzxCP/GDYacjgvO0zFwo2XrSX\nfZQvR07fYoq7ueNJgVWOfrLbx9OR3zdclXjUxlRYDwKV6uXuvG6KevM9UP3KKIDqJhCYdurylZaW\nMNrXTY3I8F9uN1gtQqgMNiO2spCylwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQByrjxpkGlLS8my\nFLN9hBmi+u6ppV6PJnHdhZTyfw/azt8o/MdF1DlXQQiUzsIFcP5TMiQePpc/DkNwXVmGj9ARewEs\nrJadAuZzqIHhsk6Dit3g6clvxhnH3OEDi+2oJjiZMghQzN6OA5HkFNJbPvArrpb1zPr4NJzGj89J\n/3hm8W2hxkXrIqIn0E3mmwCpM0z7A6J0sZaDsyLC7nV3Ou4bMBsI7P+xpUThpZ6zbOJ2+eby8Nvv\nVNba070e0kivQYjDsGIIWUsvP6hSUZc5NXwLxF0vVh9Ag7w7XknxBT1ixn9amkVvW7SduZM313va\n3MbR6t/c0TN4IF4xY9YXihMF\n-----END CERTIFICATE-----\n",
#     :name_identifier_format             => "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
# end
class OmniauthSamlSetup
  def self.call(env)
    new(env).setup
  end

  def initialize(env)
    @env = env
  end

  def setup
    @env["omniauth.strategy"].options.merge!(saml_settings)
  end

  private

  def saml_settings
    {
      idp_cert: "-----BEGIN CERTIFICATE-----\nMIIDnjCCAoagAwIBAgIGAWcWrR9eMA0GCSqGSIb3DQEBCwUAMIGPMQswCQYDVQQGEwJVUzETMBEG\nA1UECAwKQ2FsaWZvcm5pYTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzENMAsGA1UECgwET2t0YTEU\nMBIGA1UECwwLU1NPUHJvdmlkZXIxEDAOBgNVBAMMB2JpdHJpc2UxHDAaBgkqhkiG9w0BCQEWDWlu\nZm9Ab2t0YS5jb20wHhcNMTgxMTE1MDkyMDQzWhcNMjgxMTE1MDkyMTQzWjCBjzELMAkGA1UEBhMC\nVVMxEzARBgNVBAgMCkNhbGlmb3JuaWExFjAUBgNVBAcMDVNhbiBGcmFuY2lzY28xDTALBgNVBAoM\nBE9rdGExFDASBgNVBAsMC1NTT1Byb3ZpZGVyMRAwDgYDVQQDDAdiaXRyaXNlMRwwGgYJKoZIhvcN\nAQkBFg1pbmZvQG9rdGEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0ehQ8joU\nf7ZZn6iofRR3wyd8DmiDD5+1GBR6Q/Q6BRzce2ZYPTIVPq9d0FDxaZdRqo83Uqyk1LVk5E7YAQ6G\nOImUxKHZj3Fajhvmes5sbF1/QVxDqLt2TfZSIxBDJGLlMbjYPdHS+CL7CW1Gge/lEAiDDwOLTfES\nWoyXhsouYmhDitn1/E1o6WykIh7Tqs12gIPuuprRj1cji97MSbdJzxCP/GDYacjgvO0zFwo2XrSX\nfZQvR07fYoq7ueNJgVWOfrLbx9OR3zdclXjUxlRYDwKV6uXuvG6KevM9UP3KKIDqJhCYdurylZaW\nMNrXTY3I8F9uN1gtQqgMNiO2spCylwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQByrjxpkGlLS8my\nFLN9hBmi+u6ppV6PJnHdhZTyfw/azt8o/MdF1DlXQQiUzsIFcP5TMiQePpc/DkNwXVmGj9ARewEs\nrJadAuZzqIHhsk6Dit3g6clvxhnH3OEDi+2oJjiZMghQzN6OA5HkFNJbPvArrpb1zPr4NJzGj89J\n/3hm8W2hxkXrIqIn0E3mmwCpM0z7A6J0sZaDsyLC7nV3Ou4bMBsI7P+xpUThpZ6zbOJ2+eby8Nvv\nVNba070e0kivQYjDsGIIWUsvP6hSUZc5NXwLxF0vVh9Ag7w7XknxBT1ixn9amkVvW7SduZM313va\n3MbR6t/c0TN4IF4xY9YXihMF\n-----END CERTIFICATE-----",
      idp_sso_target_url: "https://bitrise.okta.com/app/bitrise_ssoproto_1/exk561rk8B7TnmiP5356/sso/saml"
    }
  end
end