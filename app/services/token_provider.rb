module TokenProvider
  # Extends current class (self) ?
  # Todo understand > http://www.integralist.co.uk/posts/eigenclass.html
  #                 > http://stackoverflow.com/questions/2505067/class-self-idiom-in-ruby
  class << self
    def issue_token(payload)
      payload[:exp] = Time.now.to_i + 1.month
      JWT.encode(payload, Rails.application.secrets.jwt_key)
    end

    def valid?(token)
      begin
        JWT.decode(token, Rails.application.secrets.jwt_key)
      end
    end
  end
end
