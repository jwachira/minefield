# Minefield

There is a field of mines. Each mine is identified by a 2d-coordinate and a blast radius. When a mine explodes at time interval t, it explodes mines that lay within its blast radius at t + 1.

Given a list of mines consisting of their X & Y coordinates and blast radius (ex 2, 2, 5), write a program that finds which mine(s) in the list trigger the greatest number of explosions. Use the Euclidean distance to determine whether a mine lays within the radius of another mine. Your program should produce an output file showing the mines, identified by their coordinates & blast radius, in descending order of total generated explosions.

## Installation

```
git clone git@github.com:jwachira/minefield.git

run `bin/setup` to install dependencies


````
## Running Specs

```
$ bin/rspec
```

## Usage

```
bin/runner input.txt output.txt (If you do not provide input file; we will use the default input file)

```

## Sample of expected output

```
  Mine | Explosion Counter
  -2,1,3 | 9
  -3,1,1 | 9
  1,1,1 | 7
  0,0,2 | 7
  1,2,1 | 7
  1,0,3 | 7
  0,1,1 | 7
  2,2,1 | 7
  -2,-1,1 | 1
  -1,-1,1 | 1
  10,6,1 | 0
  -3,-3,1 | 0
  5,4,1 | 0
  9,-3,5 | 0
  -4,-4,1 | 0
  3,-4,1 | 0
  -10,3,5 | 0
  1,7,2 | 0
```


##License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
