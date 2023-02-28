# Challenges

## Supermarket Checkout
Implement the code for a supermarket checkout that calculates the total price of a number of items. In a normal supermarket, things are identified using Stock Keeping Units, or SKUs. In our store, we’ll use individual letters of the alphabet (A, B, C, and so on). Our goods are priced individually. In addition, some items are multipriced: buy n of them, and they’ll cost you y cents. For example, item ‘A’ might cost 50 cents individually, but this week we have a special offer: buy three ‘A’s and they’ll cost you $1.30. In fact this week’s prices are:

| Item | Unit Price |     Special
| ---- | ---------- | ------------
|  A   |  50        | 3 for 130
|  B   |  30        | 2 for 45
|  C   |  20 |
|  D   |  15 |

Our checkout accepts items in any order, so that if we scan a B, an A, and another B, we’ll recognize the two B’s and price them at 45 (for a total price so far of 95). Because the pricing changes frequently, we need to be able to pass in a set of pricing rules each time we start handling a checkout transaction. Total can be called multiple times for a single transaction.

The interface to the checkout should look like:

    co = CheckOut.new(pricing_rules)
    co.scan(item)`
    co.scan(item)
    ...
    price = co.total

## Mars Rover Challenge

You are in charge of controlling a Mars rover that can move forward or turn right or left, using the following commands:

  - M: move one unit forward in the current direction.
  - L: turn 90 degrees to the left (i.e., counterclockwise).
  - R: turn 90 degrees to the right (i.e., clockwise).
  - Q: quit the prompt and shut down the Mars rover.

The rover starts at position `(0, 0)` facing North, where the x-axis goes East and the y-axis goes North. Each move command changes the rover's position by one unit in the current direction, while each turn command changes the rover's direction by 90 degrees to the left or right. The rover cannot move outside a grid of unknown size.

Write a program that reads commands from the terminal and outputs the rover's position and direction after each command, using the format `direction (x, y)`. For example:

    Mars Rover starting up
    North (0, 0)
    > M
    North (0, 1)
    > L
    West (0, 1)
    > M
    West (-1, 1)
    > M
    West (-2, 1)
    > R
    North (-2, 1)
    > R
    East (-2, 1)
    > M
    East (-1, 1)
    > R
    South (-1, 1)
    > M
    South (-1, 0)
    > Q
    Mars Rover shutting down
