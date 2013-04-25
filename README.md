This package provides useful macros for generating random objects for testing.

**`random_text`**

Example:

    describe 'upcase' do
      it 'should upcase the string.' do
        string = random_text.downcase
        upcase(string).should == string.upcase
      end
    end

**`random_email`**

Example:

    describe 'send_email' do
      it 'should send an email to the specified recipient' do
        recipient = random_email
        email = send_email(recipient, 'Hello')
        email.to.should == recipient
      end
    end

**`random_time`**

Example:

    describe 'previous_day' do
      it 'should return the timestamp 24 hours prior to the given timestamp.' do
        timestamp = random_time
        previous_day(timestamp).should == timestamp - 24.hours
      end
    end

**`random_domain`**

Example:

    describe 'browser' do
      it 'should resolve the specified domain.' do
        domain = random_domain
        browser(domain)
        agent.should have_received(:resolve).with(domain)
      end
    end

**`random_query`**


**`random_url`**

Example:

    describe 'crawl' do
      it 'should download the specified url.' do
        url = random_url
        crawl(url)
        agent.should have_received(:get).with(url)
      end
    end

**`random_exception`**

Example:

    describe 'backtrace' do
      it 'should print the backtrace of the given exception.' do
        exception = random_exception
        backtrace(exception).should == exception.backtrace.join("\n")
      end
    end

**`random_hash`**

Example:

    describe 'backtrace' do
      it 'should stringify keys." do
        hash = random_hash.symbolize_keys
       	stringify(hash).should == hash.stringify_keys
      end
    end


To make these macros available in your specs, do the following:

**Gemfile**

    group :test do
      ...
      gem 'specstar-support-random', '~> 0.0.1'
      ...
    end

**spec/spec_helper.rb**

    require 'specstar/support/random'
    ...


