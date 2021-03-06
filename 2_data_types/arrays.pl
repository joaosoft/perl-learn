#!/usr/bin/perl
use strict;
use warnings;

# Arrays
=begin 
Arrays are ordered lists of scalars that you access with a numeric index, which starts with 0. 
They are preceded by an "at" sign (@).
=cut

## Array Variables
@ages = (25, 30, 40);             
@names = ("John Paul", "Lisa", "Kumar");

print "\$ages[0] = $ages[0]\n";
print "\$ages[1] = $ages[1]\n";
print "\$ages[2] = $ages[2]\n";
print "\$names[0] = $names[0]\n";
print "\$names[1] = $names[1]\n";
print "\$names[2] = $names[2]\n";
# This will produce the following result
# $ages[0] = 25
# $ages[1] = 30
# $ages[2] = 40
# $names[0] = John Paul
# $names[1] = Lisa
# $names[2] = Kumar


# An array is a variable that stores an ordered list of scalar values. 
# Array variables are preceded by an "at" (@) sign. To refer to a single element of an array, 
# you will use the dollar sign ($) with the variable name followed by the index of the element in square brackets.


## Array Creation
@array = (1, 2, 'Hello');
@array = qw/This is an array/;

# The second line uses the qw// operator, which returns a list of strings, 
# separating the delimited string by white space. In this example, this leads 
# to a four-element array; the first element is 'this' and last (fourth) is 'array'. 
# This means that you can use different lines as follows
@days = qw/Monday
Tuesday
...
Sunday/;

# You can also populate an array by assigning each value individually as follows −
$array[0] = 'Monday';
...
$array[6] = 'Sunday';


## Accessing Array Elements
@days = qw/Mon Tue Wed Thu Fri Sat Sun/;

print "$days[0]\n";
print "$days[1]\n";
print "$days[2]\n";
print "$days[6]\n";
print "$days[-1]\n";
print "$days[-7]\n";
# This will produce the following result 
# Mon
# Tue
# Wed
# Sun
# Sun
# Mon

# Array indices start from zero, so to access the first element you need to give 0 as indices. 
# You can also give a negative index, in which case you select the element from the end, 
# rather than the beginning, of the array. 
# This means the following 

print $days[-1]; # outputs Sun
print $days[-7]; # outputs Mon


## Sequential Number Arrays
@var_10 = (1..10);
@var_20 = (10..20);
@var_abc = (a..z);

print "@var_10\n";   # Prints number from 1 to 10
print "@var_20\n";   # Prints number from 10 to 20
print "@var_abc\n";  # Prints number from a to z

# Here double dot (..) is called range operator. This will produce the following result
# 1 2 3 4 5 6 7 8 9 10
# 10 11 12 13 14 15 16 17 18 19 20
# a b c d e f g h i j k l m n o p q r s t u v w x y z


## Array Size
@array = (1,2,3);
print "Size: ",scalar @array,"\n";

# The value returned will always be the physical size of the array, not the number of valid elements. 
# You can demonstrate this, and the difference between scalar @array and $#array, using this fragment is as follows 
@array = (1,2,3);
$array[50] = 4;

$size = @array;
$max_index = $#array;

print "Size:  $size\n";
print "Max Index: $max_index\n";
# This will produce the following result 
# Size: 51
# Max Index: 50

# There are only four elements in the array that contains information, but the array is 51 elements long, with a highest index of 50.


## Adding and Removing Elements in Array
=begin
# push @ARRAY, LIST
Pushes the values of the list onto the end of the array.

# pop @ARRAY
Pops off and returns the last value of the array.

# shift @ARRAY
Shifts the first value of the array off and returns it, shortening the array by 1 and moving everything down.

# unshift @ARRAY, LIST
Prepends list to the front of the array, and returns the number of elements in the new array.
=cut

# create a simple array
@coins = ("Quarter","Dime","Nickel");
print "1. \@coins  = @coins\n";

# add one element at the end of the array
push(@coins, "Penny");
print "2. \@coins  = @coins\n";

# add one element at the beginning of the array
unshift(@coins, "Dollar");
print "3. \@coins  = @coins\n";

# remove one element from the last of the array.
pop(@coins);
print "4. \@coins  = @coins\n";

# remove one element from the beginning of the array.
shift(@coins);
print "5. \@coins  = @coins\n";

# This will produce the following result 
# 1. @coins = Quarter Dime Nickel
# 2. @coins = Quarter Dime Nickel Penny
# 3. @coins = Dollar Quarter Dime Nickel Penny
# 4. @coins = Dollar Quarter Dime Nickel
# 5. @coins = Quarter Dime Nickel


## Slicing Array Elements
# You can also extract a "slice" from an array - that is, you can select more than one item from 
# an array in order to produce another array.
@days = qw/Mon Tue Wed Thu Fri Sat Sun/;
@weekdays = @days[3,4,5];
print "@weekdays\n";
# This will produce the following result 
# Thu Fri Sat



@days = qw/Mon Tue Wed Thu Fri Sat Sun/;
@weekdays = @days[3..5];
print "@weekdays\n";
# This will produce the following result 
# Thu Fri Sat


## Replacing Array Elements
# Now we are going to introduce one more function called splice(), which has the following syntax 

# splice @ARRAY, OFFSET [ , LENGTH [ , LIST ] ]

# This function will remove the elements of @ARRAY designated by OFFSET and LENGTH, 
# and replaces them with LIST, if specified. Finally, it returns the elements removed from the array. 
# Following is the example 
@nums = (1..20);
print "Before - @nums\n";

splice(@nums, 5, 5, 21..25); 
print "After - @nums\n";
# This will produce the following result 
# Before - 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
# After -   1 2 3 4 5 21 22 23 24 25 11 12 13 14 15 16 17 18 19 20
# Here, the actual replacement begins with the 6th number after that five elements 
# are then replaced from 6 to 10 with the numbers 21, 22, 23, 24 and 25.


## Transform Strings to Arrays
# Let's look into one more function called split(), which has the following syntax 

# split [ PATTERN [ , EXPR [ , LIMIT ] ] ]

# This function splits a string into an array of strings, and returns it. If LIMIT is specified, 
# splits into at most that number of fields. If PATTERN is omitted, splits on whitespace. 
# Following is the example
# define Strings
$var_string = "Rain-Drops-On-Roses-And-Whiskers-On-Kittens";
$var_names = "Larry,David,Roger,Ken,Michael,Tom";

# transform above strings into arrays.
@string = split('-', $var_string);
@names  = split(',', $var_names);

print "$string[3]\n";  # This will print Roses
print "$names[4]\n";   # This will print Michael
# This will produce the following result 
# Roses
# Michael


## Transform Arrays to Strings
# We can use the join() function to rejoin the array elements and form one long scalar string. 
# This function has the following syntax 

# join EXPR, LIST

# This function joins the separate strings of LIST into a single string with fields separated 
# by the value of EXPR, and returns the string. 
# Following is the example 
# define Strings
$var_string = "Rain-Drops-On-Roses-And-Whiskers-On-Kittens";
$var_names = "Larry,David,Roger,Ken,Michael,Tom";

# transform above strings into arrays.
@string = split('-', $var_string);
@names  = split(',', $var_names);

$string1 = join( '-', @string );
$string2 = join( ',', @names );

print "$string1\n";
print "$string2\n";
# This will produce the following result 
# Rain-Drops-On-Roses-And-Whiskers-On-Kittens
# Larry,David,Roger,Ken,Michael,Tom


## The $[ Special Variable
=begin
So far you have seen simple variable we defined in our programs and used them to store and print scalar and array values. 
Perl provides numerous special variables, which have their predefined meaning.

We have a special variable, which is written as $[. This special variable is a scalar containing the first index of all arrays. 
Because Perl arrays have zero-based indexing, $[ will almost always be 0. 
But if you set $[ to 1 then all your arrays will use on-based indexing. 
It is recommended not to use any other indexing other than zero. 
However, let's take one example to show the usage of $[ variable
=cut

# define an array
@foods = qw(pizza steak chicken burgers);
print "Foods: @foods\n";

# Let's reset first index of all the arrays.
$[ = 1;

print "Food at \@foods[1]: $foods[1]\n";
print "Food at \@foods[2]: $foods[2]\n";
# This will produce the following result 
# Foods: pizza steak chicken burgers
# Food at @foods[1]: pizza
# Food at @foods[2]: steak


## Merging Arrays
# Because an array is just a comma-separated sequence of values, you can combine them together as shown below

@numbers = (1,3,(4,5,6));

print "numbers = @numbers\n";
# This will produce the following result 
# numbers = 1 3 4 5 6


# The embedded arrays just become a part of the main array as shown below −

@odd = (1,3,5);
@even = (2, 4, 6);

@numbers = (@odd, @even);

print "numbers = @numbers\n";
# This will produce the following result 
# numbers = 1 3 5 2 4 6


## Selecting Elements from Lists
# The list notation is identical to that for arrays. 
# You can extract an element from an array by appending square brackets to the list and giving one or more indices 
$var = (5,4,3,2,1)[4];
print "value of var = $var\n"
# This will produce the following result 
# value of var = 1

# Similarly, we can extract slices, although without the requirement for a leading @ character 
@list = (5,4,3,2,1)[1..3];
print "Value of list = @list\n";
# This will produce the following result 
# Value of list = 4 3 2




############# PUSH
# Description
# This function pushes the values in LIST onto the end of the list ARRAY. Used with pop to implement stacks.

# Syntax
# Following is the simple syntax for this function −

# push ARRAY, LIST
# Return Value
# This function returns number of elements in new array.

# Example
# Following is the example code showing its basic usage −

#!/usr/bin/perl -w

$, = ",";
@array = ( 1, 2 );
print "Before pushing elements  @array \n";
push(@array, (3, 4, 5));
print "After pushing elements  @array \n";
# When above code is executed, it produces the following result −

# Before pushing elements  1 2
# After pushing elements  1 2 3 4 5




########## WANTARRAY
# Description
# This function returns true if the context of the currently executing function is looking for a list value. Returns false in a scalar context.

# Syntax
# Following is the simple syntax for this function −

# wantarray
# Return Value
# This function returns undef if no context and 0 if lvalue expects a scalar.

# Example
# Following is the example code showing its basic usage −

#!/usr/bin/perl -w

sub foo {
   return(wantarray() ? qw(A, B, C) : '1');
}
$result = foo();    # scalar context
@result = foo();    # array context
print("foo() in a  scalar context: $result\n");
print("foo() in an array  context:
@result\n");
# When above code is executed, it prod  uces the following result −
foo() in a  scalar context: 1
foo() in an array  context:
A, B, C


###############
@pizzas = ("cheese", "pepperoni", "veggie" );

@pizzas = qw(cheese pepperoni veggie );
foreach $pizza (@pizzas) {
  print "$pizza\n";
}

# This simple foreach loop produces the following output:
# cheese
# pepperoni
# veggie

$pizzas[0] = 'cheese';
$pizzas[1] = 'pepperoni';
$pizzas[2] = 'veggie';