fail "Twitter is already defined! This gem doesn't work with other twitter clients" if Object.const_defined?(:Twitter)

require 'twitter/default'
require 'twitter/tweet'
require 'twitter/api/timelines'
require 'twitter/client'
