# 2.3.4.fullscript
- forked and changed gemspec spree requirement from 2.3 to 2.2
- Gemfile: replaced pry dep with byebug, use hw 2.2 fork
- updated .gitignore (byebug and rbenv)
- LineItem decorator - changes to work in Spree 2.2 
- specs: 2.2 compat & config fixture tweaks
- spec_helper.rb - add monkey patch for rails 4.1 + state_machine gem

# 2.3.4
- [Refactored code and added final commit of tax in payment](https://github.com/railsdog/spree_avatax_certified/pull/55). (acreilly)
- Added model SpreeAvataxCertified::Address to handle formatting addresses for tax calculation
- Added model SpreeAvataxCertified::Line to handle formatting lines for tax calculation
- Removed commit avatax finalize from order state to complete and moved it from payment state to complete
- Added cancel tax to payment state to void

# 2.3.2

- [Refactored cart adjustments out in favor of a `TaxCalculator` class](https://github.com/railsdog/spree_avatax_certified/pull/51). (acreilly)
- Added a gem versioning system to match branch names.  Spree branch `2-3-stable` is tracked by gem branch `2-3-stable` and point releases within that branch are semantically versioned.

# 2.3

- Inital release tracking Spree `2-3-stable`.
