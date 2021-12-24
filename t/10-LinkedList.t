#!/usr/bin/rakudo

# The testing thing, idk never made unit testing in my life, i'm more
# of a assert() kind of guy.

use Test;
use LinkedList;

my $List = LinkedList::LinkedList.new();

is $List.pop_head(), False, "Delete the first element from an empty list";
is $List.pop_tail(), False, "Delete the last element from an empty list";
is $List.insert_head(1), True, "Insert an element at the head of the list";
is $List.insert_head(2), True, "Ditto";
is $List.insert_tail(3), True, "Insert an element at the end of the list";
is $List.insert_tail(4), True, "Ditto";
is $List.length(), 4, "Checking list length (All elements were added succesfully)";
is $List.get(2).value, 3, "Checking get works by getting the second element which should be 3 (starts at 0)";
is $List.destroy(), True, "Destroying list";
is $List.head, Any, "Check if list is destroyed";
is $List.pop_head(), False, "Delete head from destroyed list";
is $List.pop_tail(), False, "Delete tail from destroyed list";
is $List.get(1), Nil, "Get element from destroyed list";

done-testing;

