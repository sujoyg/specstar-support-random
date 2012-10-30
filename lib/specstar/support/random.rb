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

def random_url
  tld = ["com", "org", "net", "biz", "info", "co", "co.in"].sample
  domain = (0..rand(3)).map { random_text.downcase }.join(".")
  scheme = ["http", "https"].sample

  "#{scheme}://#{domain}.#{tld}"
end

def random_exception
  begin
    raise random_string
  rescue => e
    e
  end
end
