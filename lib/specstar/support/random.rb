def random_domain
  tld = ["com", "org", "net", "biz", "info", "co", "co.in"].sample
  domain = (0..rand(3)).map { random_text(:max_length => 12).downcase }.join(".")

  "#{domain}.#{tld}"
end

def random_email
  "#{random_text}@#{random_text}.com".downcase
end

def random_exception
  begin
    raise random_text
  rescue => e
    e
  end
end

def random_hash(options={})
  hash = {}
  elements = options[:length] || 1 + rand(options[:max_length] || 10)
  elements.times { hash[random_text.to_sym] = random_text }
  hash
end

def random_number(options={})
  output = nil
  while output.nil? || output == options[:except]
    output = rand(options[:max] || 1e9)
  end

  output
end

def random_query
  params = {}

  (0..rand(10)).each { params[random_text :max_length => 8] = random_text }
  
  params.to_param
end

def random_text(options={})
  length = if options[:length]
             options[:length]
           elsif options[:max_length]
             1 + rand(options[:max_length])
           else
             1 + rand(32)
           end

  alpha_chars = ("A".."Z").to_a + ("a".."z").to_a
  chars = alpha_chars + ("0".."9").to_a

  ([alpha_chars.sample] + (2..length).map { chars.sample }).shuffle.join("")
end

def random_time
  Time.at rand Time.now.to_i
end

def random_url(options={})
  domain = options.include?(:domain) ? options[:domain] : random_domain
  scheme = options.include?(:scheme) ? options[:scheme] : ['http', 'https'].sample
  fragment = options.include?(:fragment) ? options[:fragment] : random_text
  query = options.include?(:query)? options[:query] : random_query

  uri = URI("#{scheme}://#{domain}")
  uri.path = "/#{random_text.downcase}"
  uri.query = query
  uri.fragment = fragment

  uri.to_s
end

