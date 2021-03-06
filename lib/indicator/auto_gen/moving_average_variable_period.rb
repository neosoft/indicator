# Ta-Lib function mapping class 
# Function: 'MAVP'
# Description: 'Moving average with variable period'
# This file has been autogenerated - Do Not Edit.
class Indicator::AutoGen::MovingAverageVariablePeriod < Indicator::Base
  # Minimum Period <Integer>
  attr_accessor :minimum_period
  # Maximum Period <Integer>
  attr_accessor :maximum_period
  # MA Type <MA Type>
  attr_accessor :ma_type

  def initialize(*args)
    if args.first.is_a? Hash
      h = args.first
      @minimum_period = h[:minimum_period] || 2
      @maximum_period = h[:maximum_period] || 30
      @ma_type = h[:ma_type] || 0
    else
      @minimum_period = args[0] || 2 
      @maximum_period = args[1] || 30 
      @ma_type = args[2] || 0 
    end
    
    @func = TaLib::Function.new("MAVP")
  end

  # Is price data required as an input
  def self.price_input?
    false
  end

  # The list of arguments
  def self.arguments
    [ :minimum_period, :maximum_period, :ma_type ]
  end

  # The minimum set of inputs required
  def self.inputs
    [ :in_real, :in_periods ]
  end

  # The outputs generated by this function
  def self.outputs
    [ :out_real ]
  end

  def run(in_real, in_periods)
    len = in_real.length
    @func.in_real(0, map(in_real))
    @func.in_real(1, map(in_periods))

    @func.opt_int(0, @minimum_period)
    @func.opt_int(1, @maximum_period)
    @func.opt_int(2, @ma_type)

    out_real = Array.new(len)
    @func.out_real(0, out_real)
  
    @func.call(0, len - 1)

    out_real
  end
end
