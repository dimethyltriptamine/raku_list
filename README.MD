# LinkedList, a linked list implementation in Raku

## Why would I use this instead of a regular raku array?

You wouldn't, there's absolutely no reason to use this over regular
Raku arrays, I just made this to learn how "pointers", modules and
tests works in Raku, so there's no reason to use this, altough you can
use it if you really want, but any sane mind would use a regular
array.

## Running tests

You can run the tests with this command:

`RAKULIB=./lib rakudo t/10-LinkedList.t` 

It should give ok in everything (I ran this before writing this
document).

## Using this package

...Why would you do that?

Anyways, you can just put lib/LinkedList.pm6 in any of the directories
where Raku find modules (the equivalent of `@INC` in Raku)

~~~raku
#!/usr/bin/rakudo

use LinkedList;

my $list = LinkedList::LinkedList.new;

# Now you can use any of the methods
~~~

## Classes, attributes and methods.

The class `LinkedList` is the main class of the package, it contains
the attribute `$head` which points to the first node of the list.

It contains the subclass `Node` contains the attribute `$value` which
is the value of the linked list entry and `$next`, which is the
pointer to the next node, like a linked list you implemented on the
first computer science year. The method `new` just sets the value to
whatever you passed to it and sets the `$next` to 0. This method is
automatically called and you won't call it.

The methods of the class are:

* `insert_head($value --> Bool)`: Creates a node that has as `value`
  `$value$` and points to the old head. Always returns `True`

* `insert_tail($value --> Bool)`: Creates a node and inserts it at the
  end of the list.
* `pop_head(--> Bool)`: deletes the first element from the list,
  returns `False` if the list is empty.
* `pop_tail(--> Bool)`: deletes the last element from the list,
  returns `False` if the list is empty.
* `print()`: Iterates every element and prints the `value`.
* `length()`: returns the length of the list by iterating each element.
* `get($n)`: returns the **node** at entry `$n`, so to get the value
  you should do my $value = $list.get($n).value;
* `destroy()`: sets the `head` to `Nil`, destroying the list.
* `new()`: Creates a new list, initializing `head` to `Nil`.
