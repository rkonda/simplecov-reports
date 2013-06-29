require "bundler/gem_tasks"
require 'rake/testtask'


task :test => [
  "test_all_reports",
  "test_best_author",
  "test_file_reports",
  "test_line_enhancer"
]

Rake::TestTask.new(:test_all_reports) do |test|
  test.libs << 'lib' << 'test'
  test.test_files = FileList['test/test_all_reports.rb']
  test.verbose = true
end

task :test_best_author => [
  "test_best_author_stage1",
  "test_best_author_stage2",
  "test_best_author_stage3",
  "test_best_author_stage4",
  "test_best_author_stage5",
]

Rake::TestTask.new(:test_best_author_stage1) do |test|
  test.libs << 'lib' << 'test'
  test.test_files = FileList['test/test_best_author_stage1.rb']
  test.verbose = true
end

Rake::TestTask.new(:test_best_author_stage2) do |test|
  test.libs << 'lib' << 'test'
  test.test_files = FileList['test/test_best_author_stage2.rb']
  test.verbose = true
end

Rake::TestTask.new(:test_best_author_stage3) do |test|
  test.libs << 'lib' << 'test'
  test.test_files = FileList['test/test_best_author_stage3.rb']
  test.verbose = true
end

Rake::TestTask.new(:test_best_author_stage4) do |test|
  test.libs << 'lib' << 'test'
  test.test_files = FileList['test/test_best_author_stage4.rb']
  test.verbose = true
end

Rake::TestTask.new(:test_best_author_stage5) do |test|
  test.libs << 'lib' << 'test'
  test.test_files = FileList['test/test_best_author_stage5.rb']
  test.verbose = true
end

Rake::TestTask.new(:test_file_reports) do |test|
  test.libs << 'lib' << 'test'
  test.test_files = FileList['test/test_file_reports.rb']
  test.verbose = true
end

Rake::TestTask.new(:test_line_enhancer) do |test|
  test.libs << 'lib' << 'test'
  test.test_files = FileList['test/test_line_enhancer.rb']
  test.verbose = true
end
