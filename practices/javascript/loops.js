#!/usr/bin/env node

// ----------------------------------------------------------------
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

// ----------------------------------------------------------------
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

// ----------------------------------------------------------------
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

// ----------------------------------------------------------------
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

// ----------------------------------------------------------------
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
