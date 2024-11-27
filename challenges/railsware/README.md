 #      Railsware assessment
Please complete the following challenges to the best of your ability.

## Railsware: General Programming assessment (Ruby) 1.0

Here is the assessment task we prepared as a part of our recruitment process.

Please conduct the whole task in this Qualified app (not in your local env) so we can see the progress and history of your work. For us it's important to be able review and understand your approach to code.

Please note that when reviewing the test task we can see the task screen and the task progress while you worked on it. We would notice if the solution has been copy pasted from somewhere or Chat GPT has been used. In case we notice copied code, your task will be automatically rejected.

The time when you can access the task is not limited.

However, please allocate time for the task so you finish it within one try - it will allow us to review the results properly

Good luck!

This test task and related material are owned by Railsware Products Studio LLC ("Railsware"). Unauthorized copying and use of these materials without a valid license is strictly prohibited. Access to these materials is restricted solely to individuals who have been expressly granted access by Railsware. Any unauthorized use, reproduction, or distribution of these materials may result in legal action being pursued by Railsware to enforce its intellectual property rights. By accessing the test task and related materials, you acknowledge and agree to abide by these terms and conditions.

## 4 Challenges
This is the total number of challenges in the assessment represented and navigable by the dots on the left-hand sidebar. You must attempt each challenge before submitting.

The following languages may be used in this assessment:

[Icons showing supported languages]

Not every language is available on all challenges

## Estimated 3 Hours
This is the estimated amount of time that this assessment should take.
However, you can take more time if you need it, and you can always check the timer in the bottom left corner to see how you're doing.

## Challenge 1
Let's write a simple markdown parser function that will take in a single line of markdown and be translated into the appropriate HTML. To keep it simple, we’ll support only one feature of markdown in ATX syntax: headers.

Headers are designated by (1-6) hashes followed by a space, followed by text. The number of hashes determines the header level of the HTML output.

---

Specifications
```ruby
markdown_parser(markdown)
```

Transforms given string into correct header form.

Parameters:

- markdown: String - String to be changed into markdown format.

Return Value:

- String - Formatted string.

Examples:

markdown	| Return Value
---	| ---
"# Header"	| <h1>Header</h1>
"## Header"	| <h2>Header</h2>
"###### Header"	| <h6>Header</h6>

---

## Challenge 2

Write a function that takes a string input, and returns the first character that is not repeated anywhere in the string.
For example, if given the input 'stress', the function should return 't', since the letter t only occurs once in the string, and occurs first in the string.
As an added challenge, upper- and lowercase letters are considered the same character, but the function should return the correct case for the initial letter. For example, the input 'sTreSs' should return 'T'.
If a string contains all repeating characters, it should return the empty string ("").

## Challenge 3

We need the ability to divide an unknown integer into a given number of even parts — or at least as even as they can be. The sum of the parts should be the original value, but each part should be an integer, and they should be as close as possible.

Complete the function so that it returns an array of integers representing the parts. Ignoring the order of the parts, there is only one valid solution for each input to your function!

Also, there is no reason to test for edge cases: the input to your function will always be valid for this challenge.

Specification

```javascript
splitInteger(num, parts)
```

Divides an integer into an "even as can be" number of parts.

Parameters:

- num: Number - The number that should be split into equal parts.
- parts: Number - The number of parts that the number should be split into.

Return Value:

- Array<Number> - An array of parts, with each index representing the part and the number contained within it representing the size of the part. The parts will be ordered from smallest to largest.

Examples:

num	| parts	| Return Value
---	| ---	| ---
10	| 5	| [2, 2, 2, 2, 2]
20	| 6	| [3, 3, 3, 3, 4, 4]

## Challenge 4

Task
Given the schema presented below, find two actors who cast together the most and list the titles of those movies. Order the result set alphabetically.

Table: film_actor

Column	| Type	| Modifiers
---	| ---	| ---
actor_id	| smallint	| not null
film_id	| smallint	| not null
...	|	...	|	...

Table: actor
Column	| Type	| Modifiers
---	| ---	| ---
actor_id	| integer	| not null
first_name	| character varying(45)	| not null
last_name	| character varying(45)	| not null
...	|	...	|	...

Table: film

Column	| Type	| Modifiers
---	| ---	| ---
film_id	| integer	| not null
title	| character varying(255)	| not null
...	|	...	|	...


Desired Output
first_actor	| second_actor	| title
---	| ---	| ---
John Doe	| Jane Doe	| The Best Movie Ever
...	|	...	|	...


- first_actor - Full name (First name + Last name separated by a space)
- second_actor - Full name (First name + Last name separated by a space)
- title - Movie title

Note: actor_id of the first_actor should be lower than actor_id of the second_actor
