# Methods Covered


class NonCoveredMethod
  if false
    def emptyMethod
    end

    def emptyMethod_BlankLine

    end

    def emptyMethod_Comments
      # first comment
    end
  end

  # Methods with code in them
  def method_Code
    method = "method_Code"
  end

  def method_Comment_Code
    # first comment

    method = "method_Comment_Code"
  end

  def method_BlankLine_Code

    method = "method_BlankLine_Code"
  end

  # Methods that are covered, just for sakes
  def covered_method
    method = "I am covered"
  end
end

