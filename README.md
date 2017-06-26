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

So lines in the file should look something like this:

```
8C TS KC 9H 4S 7D 2S 5D 3S AC
5C AD 5D AC 9C 7C 5H 8D TD KS
```

Additionally, euler_poker does not validate that hands are valid. Per the
instructions:

> You can assume that all hands are valid (no invalid characters or repeated
> cards), each player's hand is in no specific order, and in each hand there is
> a clear winner.

# Architecture

The basic architecture of my solution is as follows:

- `EulerPoker::Hand` represents a hand of five cards.
- There are sublcasses of `EulerPoker::Hand` for each hand type (straight,
  flush, three of a kind, etc.)
- `EulerPoker::Hand` implements [`Comparable`] for comparisons between hands
  of different types.
- Each subclasses implements `Comparable` for comparisons between hands of that
  type.

The winner of a round of poker can then be determined by comparing the two hands
with `<` or `>`.

### Supporting Cast

`EulerPoker::Hand` and it's subclasses comprise the core of this solution, but
there are some other classes which provide support:

- `EulerPoker::HandFactory` takes a string of text representing a hand of cards
  and instantiates the corresponding subclass of `EulerPoker::Hand`.
- `EulerPoker::Card` represents a single card and is primarily concerned with
  enabling comparison of a card's rank. This is mainly an issue because of face
  cards, which need to be translated into a numeric ranking.
- `EulerPoker::Round` (as in a round of poker) represents a pair of hands which
  will be compared to determine the winner.
- `EulerPoker::CLI` contains the logic for actually reading the contents of a
  file and determining how many rounds were won by Player 1.

### Terminology

As you browse the source code, some of the terms may be confusing (perhaps
_because_ they are the correct terms). So, here are some definitions:

- Suit is the suit of a card (spade, heart, diamond, club).
- Rank is the numeric ranking of a card (numbered cards are their number, Jack
  is 11, Queen is 12, King is 13, Ace, is 14).
- Ranking is the ranking of the hand type (straight, flush, etc.) in relation
  to other hand types.
- Round is a pair of hands (as in a round of poker).

[Comparable]: https://ruby-doc.org/core-2.4.0/Comparable.html

# Caveats

- Royal Flush is not implemented because it is just a special case of Straight
  Flush.
- No validation is taking place (the instructions for [problem 54] state that
  the file to be parsed can be assumed to be valid). There is a commented out
  test file (`test/test_hand_validation.rb`) with a first approximation of what
  should be validated if this were designed to take input which could contain
  errors.
