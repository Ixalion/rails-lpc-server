module RubyExt
  refine Integer do
    def to_si(bit_length)
      mid = 2**(bit_length-1)
      max_unsigned = 2**bit_length

      return ((self>=mid) ? self - max_unsigned : self)
    end
  end
end
