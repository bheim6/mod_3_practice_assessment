class ForecastDay
  # attr_reader :attrs
    def initialize(attrs)
      @attrs = attrs
    end

    def date
      "#{attrs[:date][:weekday]}, #{attrs[:date][:monthname]} #{attrs[:date][:day]}"
    end

    def high
      attrs[:high][:fahrenheit]
    end

    def low
      attrs[:low][:fahrenheit]
    end

    def conditions
      attrs[:conditions]
    end

    private
      attr_reader :attrs
end
