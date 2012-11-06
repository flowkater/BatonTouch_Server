class	ApiConstraints
	def initialize(options)
		@version = options[:version]
		@dafault = options[:default]
	end

	def matches?(req)
		@default || req.headers['Accept'].include?("application/vnd.batontouch.v#{@version}")
	end
end