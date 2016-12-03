require 'json'

module BasicSerializer

  @@serialize_method = JSON

  def serialize
    obj = {}

    instance_variables.map do |var|
      obj[var] = instance_variable_get(var)
    end

    @@serialize_method.dump(obj)
  end

  def self.deserialize(series)
    obj = @@serialize_method.parse(series)

    obj
  end
end
