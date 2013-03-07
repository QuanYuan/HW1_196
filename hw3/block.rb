def double_open filename1, filename2
  open( filename1 ) do |f1|
    open( filename2 ) do |f2|
      until f1.eof? || f2.eof?
        yield f1, f2
      end
    end
  end
end

double_open( "hw3/file_a", "hw3/file_b" ) do |f1, f2|
  puts f1.readline.strip + " | " + f2.readline
end

=begin
in console use:
load '/home/quanyuan/Desktop/cis196/hw1/block.rb'
to execute it
=end

