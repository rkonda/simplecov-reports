# Classes Covered

# Classes with no significant lines of code

class CoveredClass_Empty_None
end

class CoveredClass_Empty_BlankLine

end

class CoveredClass_Empty_Comments
  # first comment
end


# Classes with code in them

class CoveredClass_Code
  def coveredClass_Code_method
  end
end

class CoveredClass_Comment_Code
  # first comment

  def coveredClass_Comment_Code_method
  end
end

class CoveredClass_BlankLine_Code

  def coveredClass_BlankLine_Code_method
  end
end


# Classes Covered although not actually used

# Classes with no significant lines of code

class CoveredClass_Unused_Empty_None
end

class CoveredClass_Unused_Empty_BlankLine

end

class CoveredClass_Unused_Empty_Comments
  # first comment
end


# Classes with code in them

class CoveredClass_Unused_Code
  def coveredClass_Unused_Code_method
  end
end

class CoveredClass_Unused_Comment_Code
  # first comment

  def coveredClass_Unused_Comment_Code_method
  end
end

class CoveredClass_Unused_BlankLine_Code

  def coveredClass_Unused_BlankLine_Code_method
  end
end

# Class that's not covered
if false
  class NonCoveredClass
    def non_covered_method
    end
  end
end
