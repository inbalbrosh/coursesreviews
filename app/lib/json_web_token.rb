class JsonWebToken
  def self.encode(payload, exp = 30.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, ENV['JWT_SECRET_KEY'])
  end

  def self.decode(token)
    decoded = JWT.decode(token, ENV['JWT_SECRET_KEY'])[0]
    HashWithIndifferentAccess.new(decoded)
  end
end
