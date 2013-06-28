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
    puts "method_Code"
  end

  def method_Comment_Code
    # first comment

    puts "method_Comment_Code"
  end

  def method_BlankLine_Code

    puts "method_BlankLine_Code"
  end

  # Methods that are covered, just for sakes
  def covered_method
    puts "I am covered"
  end
end

