def attribute(name, &block)

  name, def_val = name.first if name.is_a? Hash
  

  define_method name do
    instance_variable_defined?("@#{name}") ? instance_variable_get("@#{name}") : instance_variable_set("@#{name}", def_val || instance_eval(&block))
  end

  define_method "#{name}?" do
    instance_variable_get("@#{name}") ? true : false
  end
  
  define_method "#{name}=" do |value|
    instance_variable_set("@#{name}", value)
  end
end
