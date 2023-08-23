# pagopa.gov.it

output "ses_pagopa_gov_it_verification_token" {
  value = module.ses_pagopa_gov_it.verification_token
}

output "ses_pagopa_gov_it_dkim_tokens" {
  value = module.ses_pagopa_gov_it.dkim_tokens
}

output "ses_pagopa_gov_it_user_access_key_id" {
  value = module.ses_pagopa_gov_it.ses_user_access_key_id
}

output "ses_pagopa_gov_it_user_secret_access_key" {
  value     = module.ses_pagopa_gov_it.ses_user_secret_access_key
  sensitive = true
}

# ricevute.pagopa.it

output "ses_ricevute_pagopa_it_verification_token" {
  value = module.ses_ricevute_pagopa_it.verification_token
}

output "ses_ricevute_pagopa_it_dkim_tokens" {
  value = module.ses_ricevute_pagopa_it.dkim_tokens
}

output "ses_ricevute_pagopa_it_user_access_key_id" {
  value = module.ses_ricevute_pagopa_it.ses_user_access_key_id
}

output "ses_pagopa_ricevute_it_user_secret_access_key" {
  value     = module.ses_ricevute_pagopa_it.ses_user_secret_access_key
  sensitive = true
}

# platform.pagopa.it

output "ses_platform_pagopa_it_verification_token" {
  value = module.ses_platform_pagopa_it.verification_token
}

output "ses_platform_pagopa_it_dkim_tokens" {
  value = module.ses_platform_pagopa_it.dkim_tokens
}

output "ses_platform_pagopa_it_user_access_key_id" {
  value = module.ses_platform_pagopa_it.ses_user_access_key_id
}

output "ses_pagopa_platform_it_user_secret_access_key" {
  value     = module.ses_platform_pagopa_it.ses_user_secret_access_key
}  

# selfcare.platform.pagopa.it

output "ses_selfcare_platform_pagopa_it_verification_token" {
  value = module.ses_selfcare_platform_pagopa_it.verification_token
}

output "ses_selfcare_platform_pagopa_it_dkim_tokens" {
  value = module.ses_selfcare_platform_pagopa_it.dkim_tokens
}

output "ses_selfcare_platform_pagopa_it_user_access_key_id" {
  value = module.ses_selfcare_platform_pagopa_it.ses_user_access_key_id
}

output "ses_pagopa_selfcare_platform_it_user_secret_access_key" {
  value     = module.ses_selfcare_platform_pagopa_it.ses_user_secret_access_key
  sensitive = true
}