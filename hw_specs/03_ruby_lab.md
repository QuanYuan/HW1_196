# 1. IRB

Run IRB:

    $ irb

You should see a Ruby prompt (yours may look a little different).

    >>

Let’s evaluate a simple expression:

    >> 1 + 2

    => 3

# 2. Methods

In Ruby, integers are objects. Let’s see what methods the integer 1 knows about:

    >> 1.methods

    => [:to_s, :-@, :+, :-, :*, :/, :div, :%, :modulo, :divmod, :fdiv, :**, :abs, :magnitude, :==, :===, :<=>, :>, :>=, :<, :<=, :~, :&, :|, :^, :[], :<<, :>>, :to_f, :size, :zero?, :odd?, :even?, :succ, :integer?, :upto, :downto, :times, :next, :pred, :chr, :ord, :to_i, :to_int, :floor, :ceil, :truncate, :round, :gcd, :lcm, :gcdlcm, :numerator, :denominator, :to_r, :rationalize, :singleton_method_added, :coerce, :i, :+@, :eql?, :quo, :remainder, :real?, :nonzero?, :step, :to_c, :real, :imaginary, :imag, :abs2, :arg, :angle, :phase, :rectangular, :rect, :polar, :conjugate, :conj, :between?, :nil?, :=~, :!~, :hash, :class, :singleton_class, :clone, :dup, :initialize_dup, :initialize_clone, :taint, :tainted?, :untaint, :untrust, :untrusted?, :trust, :freeze, :frozen?, :inspect, :methods, :singleton_methods, :protected_methods, :private_methods, :public_methods, :instance_variables, :instance_variable_get, :instance_variable_set, :instance_variable_defined?, :instance_of?, :kind_of?, :is_a?, :tap, :send, :public_send, :respond_to?, :respond_to_missing?, :extend, :display, :method, :public_method, :define_singleton_method, :__id__, :object_id, :to_enum, :enum_for, :equal?, :!, :!=, :instance_eval, :instance_exec, :__send__]

It can be hard to find what you’re looking for in that group, so let’s sort by name and also let’s remove the methods common to all objects.

    >> 1.methods.sort - Object.new.methods

    => [:%, :&, :*, :**, :+, :+@, :-, :-@, :/, :<, :<<, :<=, :>, :>=, :>>, :[], :^, :abs, :abs2, :angle, :arg, :between?, :ceil, :chr, :coerce, :conj, :conjugate, :denominator, :div, :divmod, :downto, :even?, :fdiv, :floor, :gcd, :gcdlcm, :i, :imag, :imaginary, :integer?, :lcm, :magnitude, :modulo, :next, :nonzero?, :numerator, :odd?, :ord, :phase, :polar, :pred, :quo, :rationalize, :real, :real?, :rect, :rectangular, :remainder, :round, :singleton_method_added, :size, :step, :succ, :times, :to_c, :to_f, :to_i, :to_int, :to_r, :truncate, :upto, :zero?, :|, :~]

Let’s write ’hello world’.

    >> def hello
    ?> puts "Hello world!"
    ?> end
    => nil

    >> hello
    Hello world!
    => nil

# 3. Self

The reason just typing hello works is because methods without an explicit object are run against self. In this case, we’re in an instance of Object.

    >> self
    => main

    >> self.class
    => Object

# 4. Enumerable (submit)

Experiment with Enumerable methods that take a Block. Define `my_array` with the value of `[0,10,20,30,40,50,60,70,80,90,100]`. Use the `delete_if` method to generate an Array containing numbers >= 50. The documentation for Array and its methods is here: http://www.ruby-doc.org/core/classes/Array.html. Submit the code you used.

# 5. Hashes

Developers often specify options in Hash form. Define a hash of default options for a car:

    default_options = { :color => 'Red', :seats => 4, :air_conditioning => true, :power_steering => true, :transmission_type => "auto"}

Now, specify a hash of our specific options for a given car:

    edsel_options = { :color => 'Blue', :seats => 6 }

Finally, merge the specific car’s options with the default options:

    default_options.merge(edsel_options)

Any options defined in the specific car’s options override the corresponding default options hash. Take a look at the resulting hash returned by the merge method. You now have a full set of car options where the `default_options` elements fill in any values not supplied by the `edsel_options` hash.

This technique is used by a number of Rails components, such as date selection fields, to keep the user from having to specify a full set of properties. An example of a method that takes a set of options, specified via hash, is `DateHelper.date_select`. Take a look at the DateHelper documentation for this class: http://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html#method-i-date_select.

# 6. Blocks (submit)

You can use File.open to open text files in ruby like so:

    File.open("names.txt") do |f|
      print f.readline
    }

Write a method called `double_open` that opens two files, then yields both of them. Use this method to print out the lines of both files side by side with a pipe ( '|' ) between them until one of the files runs out of lines. Note that this should be 2 functions one will use the `yield` statement to call out to the other.

You should be able to call them method like this:

    double_open('file_a', 'file_b') do |fa, fb|
      # print a line from a and b
    end

Given a file_a that looks like this:

    apple
    bear
    carrot

And a file_b that looks like this:

    123
    456
    789

The output should look something like:

    apple | 123
    bear | 456
    carrot | 789

http://mislav.uniqpath.com/poignant-guide/book/chapter-6.html may have some useful information. Submit the `double_open` function you write as well as the code to use it to print the two files.

Be sure to check out `String#strip` and `IO#eof?` as they'll probably be useful in your implementation.
