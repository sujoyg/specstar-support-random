def random_email
  "#{random_text}@#{random_text}.com".downcase
end

def random_text(options={})
  length = if options[:length]
             options[:length]
           elsif options[:max_length]
             1 + rand(options[:max_length])
           else
             1 + rand(32)
           end

  chars = ("A".."Z").to_a + ("a".."z").to_a + ("0".."9").to_a

  (1..length).map { chars.sample }.join("")
end

def random_time
  Time.at rand Time.now.to_i
end

def random_domain
  tld = ["com", "org", "net", "biz", "info", "co", "co.in"].sample
  domain = (0..rand(3)).map { random_text(:max_length => 12).downcase }.join(".")

  "#{domain}.#{tld}"
end

def random_query
  params = {}

  (0..rand(10)).each { params[random_text :max_length => 8] = random_text }
  
  params.to_param
end

def random_url(options={})
  domain = options.delete(:domain) || random_domain

  uri = URI("#{['http', 'https'].sample}://#{domain}")
  uri.path = "/#{random_text.downcase}"
  uri.query = random_query

  uri.to_s
end

def random_exception
  begin
    raise random_string
  rescue => e
    e
  end
end
