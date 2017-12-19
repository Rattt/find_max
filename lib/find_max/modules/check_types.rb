module FindMax::Modules
  module CheckTypes

    def is_number?(obj)
      obj.to_s == obj.to_i.to_s
    end

  end
end