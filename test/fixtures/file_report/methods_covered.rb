# Methods Covered


class CoveredMethod
  # Methods with no significant lines of code. These methods are excepted from reported not covered.
  def emptyMethod
  end

  def emptyMethod_BlankLine

  end

  def emptyMethod_Comments
    # first comment
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

# Methods that are not covered, just for sakes
  def non_covered_method
    method = "I am not covered"
  end
end

