module UsersHelper
  NUMBER_REGEX = /\A[-+]?[0-9]*\.?[0-9]+\Z/

  def xml_to_hash(xml_string)
    Hash.from_xml(xml_string).map { |k, v| v.match(NUMBER_REGEX) ? { k => v.to_d } : { k => v } }.first
  end
end
