module Kernel
  def describe(comment)
    puts comment.red
    if block_given?
      yield
    else
      p "Missing block"
    end
  end

  def it(comment)
    if block_given?
      begin
        yield
        puts comment.green
      rescue => e
        puts comment.red
        puts e.to_s.red
      end
    else
      puts "#{comment} pending"
    end
  end
end

class Object
  def should_equal object
    if(self != object)
      raise "#{object} is not equal to #{self}"
    end
  end

  def should_not_be_nil
    if(self.nil?)
      raise "#{self} was supposed to be nil"
    end
  end

  def should_be_nil
    unless(self.nil?)
      raise "#{self} was not supposed to be nil"
    end
  end
end

class String
  def red
    "\e[31m#{self}\e[0m"
  end

  def green
    "\033[32m#{self}\033[0m"
  end
end
