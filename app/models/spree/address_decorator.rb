Spree::Address.class_eval do
  def avatax_cache_key
    attributes.map { |k,v | v.to_s unless %w(id created_at updated_at).include?(k)}.join('-')
  end
end
