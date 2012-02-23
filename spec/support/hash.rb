module HashForTables
  # Return a new hash with all keys converted to strings.
  def attributize_keys
    dup.stringify_keys!
  end

  # Destructively convert all keys to strings.
  def attributize_keys
    keys.each do |key|
      self[key.parameterize.underscore.to_sym] = delete(key)
    end
    self
  end
end

Hash.send(:include, HashForTables)
