class ToiletPublisher
  def self.publish(toilet)
    $redis.publish("toilet/#{toilet.id}", ToiletSerializer.new(toilet).attributes.to_json)
  end
end