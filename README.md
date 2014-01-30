# tic-tac-toe

[![Build Status](https://travis-ci.org/chriswoodford/tic-tac-toe.png?branch=master)](https://travis-ci.org/chriswoodford/tic-tac-toe)
[![Code Climate](https://codeclimate.com/github/chriswoodford/tic-tac-toe.png)](https://codeclimate.com/github/chriswoodford/tic-tac-toe)
[![Coverage Status](https://coveralls.io/repos/chriswoodford/tic-tac-toe/badge.png?branch=master)](https://coveralls.io/r/chriswoodford/tic-tac-toe?branch=master)

A simple tic-tac-toe game built in Ruby

## Playing the Game

bin/tic-tac-toe

## Rules of the Game

2 Players. You vs the CPU  
The CPU is 'X', you're 'O'  

The CPU gets to make the first move.  

When you're prompted to make a move, just enter the row and column where you
would like your 'O' to go.  

e.g. `Player make a move:`  
Just enter `B,2`  

## Developing

### Dependencies

rspec (2.14)
rake
coveralls

### Running the Test Suite

In order to run the test suite, you need to install the dependencies

    bundle install

To run the test suite

    rake test
