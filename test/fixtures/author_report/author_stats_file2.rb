# author=="AuthorTesterOne"
# (1/10) 10% coverage
if COVERAGE == "cover"
else
  line = "Author-1 1"
  line = "Author-1 2"
  line = "Author-1 3"
  line = "Author-1 4"
  line = "Author-1 5"
  line = "Author-1 6"
  line = "Author-1 7"
  line = "Author-1 8"
  line = "Author-1 9"
end

# author=="AuthorTesterThree"
# (4/4) 100% coverage
if COVERAGE == "cover"
  line = "Author-3 1"
  line = "Author-3 2"
  line = "Author-3 3"
else
end

# author=="AuthorTesterFour"
# (0/0) coverage is NA
