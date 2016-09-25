# Raindrops

Write a program that converts a number to a string, the contents of which depends on the number's factors.

- If the number contains 3 as a factor, output 'Pling'.
- If the number contains 5 as a factor, output 'Plang'.
- If the number contains 7 as a factor, output 'Plong'.
- If the number does not contain 3, 5, or 7 as a factor,
  just pass the number's digits straight through.

## Examples

- 28's factors are 2, 4, **7**, 14.
  - In raindrop-speak, this would be a simple "Plong".
- 30's factors are 2, **3**, **5**, 6, 15.
  - In raindrop-speak, this would be a "PlingPlang".
- 34 only has two factors- 2 and 17.
  - Raindrop-speak doesn't know what to make of that,
    so it just goes with the straightforward "34".

## Setup

Follow the setup instructions for Crystal here:

http://exercism.io/languages/crystal

More help installing can be found here:

http://crystal-lang.org/docs/installation/index.html

## Making the Test Suit Pass

Execute the tests with:

```bash
$ crystal spec test_spec.cr
```

In each test suite all but the first test have been skipped.

Once you get a test passing, you can unskip the next one by changing `pending` to `it`.

## Source

A variation on a famous interview question intended to weed out potential candidates. [http://jumpstartlab.com](http://jumpstartlab.com)

## Submitting Incomplete Problems
It's possible to submit an incomplete solution so you can see how others have completed the exercise.

