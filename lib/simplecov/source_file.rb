require "ooyala-grit"
require "simplecov"

module SimpleCov
  class SourceFile
    class Line
      # Author of the line
      attr_accessor :author
      # Authored date
      attr_accessor :date
    end
  end

  SimpleCov::SourceFile.add_line_enhancer(lambda do |lines, filename|
      author_info = []
      # TODO (rkonda, 04/24/2013): Get the git repo where this file exists. Follow the directory, resolve the links,
      # then git the actual directory, then get the git repo from there.
      root_dir = Grit::Git.new(Dir.pwd).native(:rev_parse, {:base => false}, "--show-toplevel").chomp
      repo = Grit::Repo.new(root_dir)
      begin
        blame = repo.blame(File.realdirpath(filename), nil, {:base => false})
        blame.lines.each_with_index do |blame_line, line_number|
          author_info << { :author => blame_line.commit.author.name, :date => blame_line.commit.date }
        end
      rescue Exception => e
        puts "`git blame` on \'#{filename}\' encountered exception: #{e.message}. Skipping adding author info."
      end

      # Initialize lines
      lines.each_with_index do |line, i|
        line_author_info = i < author_info.length ? author_info[i] : nil
        if !line_author_info.nil?
          line.author = line_author_info[:author]
          line.date = line_author_info[:date]
        end
      end
    end
  )

end

