# author=="AuthorTesterOne"
# (3/10) 30% coverage
if COVERAGE == "cover"
  line = "Author-1 1"
  line = "Author-1 2"
else
  line = "Author-1 3"
  line = "Author-1 4"
  line = "Author-1 5"
  line = "Author-1 6"
  line = "Author-1 7"
  line = "Author-1 8"
  line = "Author-1 9"
end

# author=="AuthorTesterTwo"
# (1/4) 25% coverage
if COVERAGE == "cover"
else
  line = "Author-2 1"
  line = "Author-2 2"
  line = "Author-2 3"
end
