class Aa
  @@latests = {}

  def method_missing(name, *args, &block)
    super if !args.empty? || block
    @@latests[name] = self.class.const_get(name.to_s.capitalize).new
  end

  def self.the(x)
    @@latests[x]
  end

  class The
    def method_missing(name, *args, &block)
      super if !args.empty? || block
      A.the(name)
    end
  end
end

def a
  Aa.new
end

def an
  Aa.new
end

def the
  Aa::The.new
end
