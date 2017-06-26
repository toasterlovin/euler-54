[![Build Status](https://travis-ci.org/toasterlovin/euler_poker.svg?branch=master)](https://travis-ci.org/toasterlovin/euler_poker)

# euler_poker

A command line tool for choosing winning poker hands, per [problem 54] of
[Project Euler].

[problem 54]: https://projecteuler.net/problem=54
[Project Euler]: https://projecteuler.net

# Installation

You can install euler_poker via [RubyGems]:

```
gem install euler_poker
```

[RubyGems]: https://rubygems.org

# Usage

To use euler_poker, invoke it from your shell and specify the file you want to
evaluate as the only argument:

```
$ euler_poker /path/to/poker_hands.txt
```

This will tell you how many of the hands were won by Player 1 (per the problem's
instructions).

Files should conform to the instructions laid out by the problem:

> Each line of the file contains ten cards (separated by a single space): the
> first five are Player 1's cards and the last five are Player 2's cards.

Additionally, euler_poker does not do any validation to ensure that every card
and hand are valid. Per the instructions:

> You can assume that all hands are valid (no invalid characters or repeated
> cards), each player's hand is in no specific order, and in each hand there is
> a clear winner.

# Architecture

The basic architecture of my solution is as follows:

- `EulerPoker::Hand` represents a hand of five cards.
- There are sublcasses of `EulerPoker::Hand` for each hand type (straight,
  flush, three of a kind, etc.)
- `EulerPoker::Hand` implements `[Comparable]` for comparisons between hands
  of different types.
- The subclasses representing each hand type implement `Comparable` for
  comparisons between hands of the same type.
- Determining the winner of a round of poker then becomes as easy as comparing
  the hands with `>` or `<`.

`EulerPoker::Hand` and it's subclasses are the core of my solution, but there
are some other classes which provide support:

- `EulerPoker::HandFactory` handles taking a string of text representing a hand
  and instantiating the correct `EulerPoker::Hand` subclass.
- `EulerPoker::Card` represents a single card and is primarily concerned with
  translating cards (namely face cards) into a numeric rank for comparison.
- `EulerPoker::Round` (as in a round of poker) represents a pair of hands and a
  method for returning the winner.
- `EulerPoker::CLI` contains the logic for reading the contents of a file and
  using `EulerPoker::Round` to determine how many rounds were won by Player 1.

[Comparable]: https://ruby-doc.org/core-2.4.0/Comparable.html

# Caveats

- Royal Flush is not implemented because it is just a special case of Straight
  Flush.
- No validation is taking place (the instructions for [problem 54] state that
  the file to be parsed can be assumed to be valid). There is a commented out
  test file (`test/test_hand_validation.rb`) with a first approximation of what
  should be validated if this were designed to take input which could contain
  errors.
