include Calabash::Cucumber::Core

#
# Base class for UIKit elements
#
class UIBase
  class << self
    def class_name
      name
    end

    def property(*aParams)
      Calabash::Cucumber::Core.query(class_name, *aParams)
    end

    alias_method :prop, :property
    alias_method :p, :property

    def enabled?(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.query(q, :isEnabled).first.to_boolean
    end

    def touch(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.touch(q)
    end

    alias_method :tap, :touch

    def double_tap(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.double_tap(q)
    end

    def query(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.query(q)
    end

    alias_method :q, :query

    def flash(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Cucumber::Core.flash(q)
    end

    alias_method :f, :flash

    def accessibility_label
      property(:accessibilityLabel)
    end

    alias_method :label, :accessibility_label

    def accessibility_identifier
      property(:accessibilityIdentifier)
    end

    alias_method :identifier, :accessibility_identifier

    def help
      public_methods(false)
    end

    alias_method :h, :help

    def parse_query(aIdOrIndex)
      fail_if_invalid(aIdOrIndex)

      if aIdOrIndex.nil?
        q = "#{class_name}"
      else
        q = aIdOrIndex.is_a?(String) ? "#{class_name} marked:'#{aIdOrIndex}'" : "#{class_name} index:#{aIdOrIndex}"
      end

      q
    end

    private

    def fail_if_invalid(aParam)
      Kernel.fail('invalid parameter') unless aParam.nil? || aParam.is_a?(String) || aParam.is_a?(Integer)
    end
  end
end
