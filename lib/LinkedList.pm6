#!/usr/bin/rakudo


# I implemented a linked list in Raku, not sure why because an array
# (@) is way better than this, but for the lulz...

# This also works to see how to create modules, testing and shit.

# Declare the package

unit module LinkedList;

# The class

class LinkedList {
	has $.head is rw = Nil;
	
	class Node {
		has $.value;
		has $.next is rw = "null";
		method new($value) {
			self.bless(value => $value, next => 0);
		}
	}
	
	method insert_head($value --> Bool) {
		my Node $node = Node.new($value);
		$node.next = self.head;
		self.head = $node;
		return True;
	}
	method insert_tail($value --> Bool) {
		my $node = self.head;
		my $node_to_insert = Node.new($value);
		while $node.next {
			$node = $node.next;
		}
		$node.next = $node_to_insert;
		return True;
	}

	method pop_head(--> Bool) {
		if !self.head  {
			self.head = Nil;
			return False; # List's empty
		}
		self.head = self.head.next;
		return True;
	}

	method pop_tail(--> Bool) {
		if !self.head or !self.head.next {
			self.head = Nil;
			return False; # List is empty
			say "Here";
		} else {
			my $pointer = self.head;
			while $pointer.next.next {
				$pointer = $pointer.next;
			}
			$pointer.next = Nil;
			return True;
		}
	}
	
	method print() {
		my $cur_node = self.head;
		while $cur_node {
			say $cur_node.value;
			$cur_node = $cur_node.next;
		}
	}
	method length() {
		my $i = 0;
		my $node = self.head;
		while $node {
			$i++;
			$node = $node.next;
		}
		return $i;
	}
	method get($n) {
		if self.length() < $n {
			return Nil;
		} else {
			my $node = self.head;
			for 1..$n {
				$node = $node.next;
			}
			return $node;
		}
	}
	method destroy() {
		self.head = Nil;
		return True;
	}
	method new() {
		self.bless(head => Nil);
	}
}
