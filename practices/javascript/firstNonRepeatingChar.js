#!/usr/bin/env node

function firstNonRepeatingChar(str) {
    // Create a hash map to store character frequencies
    const charCount = {};

    // First pass: count frequencies of each character
    for (const char of str) {
        charCount[char] = (charCount[char] || 0) + 1;
    }

    // Second pass: find the first character with frequency 1
    for (const char of str) {
        if (charCount[char] === 1) {
            return char;
        }
    }

    // If no non-repeating character is found, return null
    return null;
}

// for loop
function forLoop() {
  let str = '';

  for (let i = 0; i < 9; i++) {
    if (i == 3) {
      continue;
    }

    str = str + i;
  }

  console.log(str);
  // Expected output: "01245678"
}

// for in loop
function forInLoop() {
  const object = { a: 1, b: 2, c: 3 };

  for (const property in object) {
    console.log(`${property}: ${object[property]}`);
  }

  // Expected output:
  // "a: 1"
  // "b: 2"
  // "c: 3"
}

// while loop
function whileLoop() {
  let i = 0;

  while (i < 6) {
    if (i === 3) {
      break;
    }
    i = i + 1;
  }

  console.log(i);
  // Expected output: 3
}

// do while loop
function doWhileLoop() {
  let result = '';
  let i = 0;

  do {
    i = i + 1;
    result = result + i;
  } while (i < 5);

  console.log(result);
  // Expected output: "12345"
}

// switch case
function switchCase() {
  const expr = 'Papayas';

  switch (expr) {
    case 'Oranges':
      console.log('Oranges are $0.59 a pound.');
      break;
    case 'Mangoes':
    case 'Papayas':
      console.log('Mangoes and papayas are $2.79 a pound.');
      // Expected output: "Mangoes and papayas are $2.79 a pound."
      break;
    default:
      console.log(`Sorry, we are out of ${expr}.`);
  }
}

// Example test cases
console.log(firstNonRepeatingChar("swiss"));    // Expected: "w"
console.log(firstNonRepeatingChar("success"));  // Expected: "u"
console.log(firstNonRepeatingChar("aabbcc"));   // Expected: null
