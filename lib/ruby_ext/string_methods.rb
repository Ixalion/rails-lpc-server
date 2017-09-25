module RubyExt
  refine String do
    def to_si(base, bit_length)
      val = self.to_i(base)

      mid = 2**(bit_length-1)
      max_unsigned = 2**bit_length

      return ((val>=mid) ? val - max_unsigned : val)
    end
  end
end
