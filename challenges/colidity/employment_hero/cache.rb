class Cache
  MAX_ENTRIES = 1000
  DEFAULT_TTL = 600

  def initialize(default_ttl_seconds = DEFAULT_TTL, max_entries = MAX_ENTRIES)
    @store = {}
    @default_ttl = default_ttl_seconds
    @max_entries = max_entries
    @mutex = Mutex.new  # For thread safety
  end

  def set(key, value, ttl_seconds = nil)
    @mutex.synchronize do
      cleanup if should_cleanup?

      @store[key] = {
        value: value,
        timestamp: Time.now,
        ttl: ttl_seconds || @default_ttl
      }
    end

    value
  end

  def get(key)
    return nil unless valid?(key)
    @store[key][:value]
  end

  def valid?(key)
    entry = @store[key]
    return false if entry.nil?

    elapsed_time = Time.now - entry[:timestamp]
    elapsed_time <= entry[:ttl]
  end

  # Additional helpful methods
  def delete(key)
    @store.delete(key)
  end

  def clear
    @store.clear
  end

  def size
    @store.count { |key, _| valid?(key) }
  end

  private

  def cleanup
    current_time = Time.now
    @store.delete_if { |_, entry| current_time - entry[:timestamp] > entry[:ttl] }
  end

  def should_cleanup?
    @store.size > @max_entries
  end
end


# Usage example
cache = Cache.new(600) # 10 minutes TTL

# Test basic operations
cache.set("key1", "value1")
puts cache.get("key1")  # => "value1"
puts cache.valid?("key1")  # => true

# Test expiration
cache.set("key2", "value2")
sleep(6)  # Wait for TTL to expire
puts cache.get("key2")  # => nil
puts cache.valid?("key2")  # => false

# Test overwriting
cache.set("key1", "new_value")
puts cache.get("key1")  # => "new_value"
