module Validation
	define_method(:validate) { |name, type, params = nil|
		register_validation(name, type, params)
		return false unless check(name, type, params)
		true
	}

	def validate!
		@registered_validations.each do |rv|
			raise "Validation #{rv[0]} error" unless check(*rv)
		end
	end

	def valid?
		begin
			@registered_validations.each do |rv|
				raise "Validation #{rv[0]} error" unless check(*rv)
			end
			true
		rescue
			false
		end
	end

	private

	def register_validation(name, type, params)
		@registered_validations ||= []
		@registered_validations << [name, type, params]
	end

	def check(name, type, params = nil)
		value = instance_variable_get("@#{name}")

		if type == :presence
			return false if (value.nil? || value.to_s.empty?)
		elsif type == :number
			return false if value !~ params
		elsif type == :type
			return false if value.class.to_s != params.to_s
		end

		true
	end
end

class Test
  extend Validation

  attr_accessor :hello

  @hello = 10
  validate :hello, :type, Fixnum

  @str = "string"
  validate :str, :type, String

  @presence = ""
	validate :presence, :presence
end