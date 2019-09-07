# frozen_string_literal: true

module TransactionsHelper
  NUMBER_REGEX = /\A[-+]?[0-9]*\.?[0-9]+\Z/.freeze

  def xml_to_hash(xml_string)
    hash = Hash.from_xml(xml_string)
    transaction_h = hash['transaction']
    transaction_h.each do |k, v|
      transaction_h[k] = v.to_d if k == 'amount' && v.match(NUMBER_REGEX)
    end
  end
end
