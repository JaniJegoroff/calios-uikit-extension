include Calabash::Cucumber::Core

class UIBase
  class << self
    def class_name
      name
    end

    def touch(aIdOrIndex=nil)
      q = self.parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.touch(q)
    end

    alias_method :tap, :touch

    def double_tap(aIdOrIndex=nil)
      q = self.parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.double_tap(q)
    end

    def property(*aParams)
      Calabash::Cucumber::Core.query(self.class_name, *aParams)
    end

    alias_method :prop, :property
    alias_method :p, :property

    def query(aIdOrIndex=nil)
      q = parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.query(q)
    end

    alias_method :q, :query

    def flash(aIdOrIndex=nil)
      q = parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.flash(q)
    end

    alias_method :f, :flash

    def accessibility_label
      self.property(:accessibilityLabel)
    end

    alias_method :label, :accessibility_label

    def accessibility_identifier
      self.property(:accessibilityIdentifier)
    end

    alias_method :identifier, :accessibility_identifier

    def help
      public_methods(false)
    end

    alias_method :h, :help

    def parse_query(aIdOrIndex)
      raise_if_invalid(aIdOrIndex)

      if aIdOrIndex.nil?
        qStr = "#{self.class_name}"
      else
        qStr = aIdOrIndex.is_a?(String) ? "#{self.class_name} marked:'#{aIdOrIndex}'" : "#{self.class_name} index:#{aIdOrIndex}"
      end

      qStr
    end

    private

    def raise_if_invalid(aParam)
      raise('invalid parameter') unless aParam.nil? || aParam.is_a?(String) || aParam.is_a?(Integer)
    end
  end
end
