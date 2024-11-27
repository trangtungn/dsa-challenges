## let
- [let](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/let)

```javascript
let x = 1;

if (x === 1) {
  let x = 2;

  console.log(x);
  // Expected output: 2
}

console.log(x);
// Expected output: 1
```

### Syntax

```javascript
let name1;
let name1 = value1;
let name1 = value1, name2 = value2;
let name1, name2 = value2;
let name1 = value1, name2, /* …, */ nameN = valueN;
```

### Temporal dead zone (TDZ)
- [TDZ](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/let#temporal_dead_zone_tdz)

- A variable declared with let, const, or class is said to be in a "temporal dead zone" (TDZ) from the start of the block until code execution reaches the place where the variable is declared and initialized.

```javascript
{
  // TDZ starts at beginning of scope
  console.log(bar); // "undefined"
  console.log(foo); // ReferenceError: Cannot access 'foo' before initialization
  var bar = 1;
  let foo = 2; // End of TDZ (for foo)
}
```

```javascript
{
  // TDZ starts at beginning of scope
  const func = () => console.log(letVar); // OK

  // Within the TDZ letVar access throws `ReferenceError`

  let letVar = 3; // End of TDZ (for letVar)
  func(); // Called outside TDZ!
}
```

### Redeclarations

`let` declarations cannot be in the same scope as any other declaration, including `let`, `const`, `class`, `function`, `var`, and `import` declaration.

```javascript
{
  let foo;
  let foo; // SyntaxError: Identifier 'foo' has already been declared
}
```

A `let` declaration within a function's body cannot have the same name as a parameter.

```javascript
function foo(a) {
  let a = 1; // SyntaxError: Identifier 'a' has already been declared
}

try {
} catch (e) {
  let e; // SyntaxError: Identifier 'e' has already been declared
}
```

### Examples

#### Scoping rules

```javascript
function varTest() {
  var x = 1;
  {
    var x = 2; // same variable!
    console.log(x); // 2
  }
  console.log(x); // 2
}

function letTest() {
  let x = 1;
  {
    let x = 2; // different variable
    console.log(x); // 2
  }
  console.log(x); // 1
}
```

- At the top level of programs and functions, let, unlike var, does not create a property on the global object.

```javascript
var x = "global";
let y = "global";
console.log(this.x); // "global"
console.log(this.y); // undefined
```

#### TDZ combined with lexical scoping

```javascript
function test() {
  var foo = 33;
  if (foo) {
    let foo = foo + 55; // ReferenceError
  }
}
test();
```

```javascript
function go(n) {
  // n here is defined!
  console.log(n); // { a: [1, 2, 3] }

  for (let n of n.a) {
    //          ^ ReferenceError
    console.log(n);
  }
}

go({ a: [1, 2, 3] });
```

#### Other situations

```javascript
var a = 1;
var b = 2;

{
  var a = 11; // the scope is global
  let b = 22; // the scope is inside the block

  console.log(a); // 11
  console.log(b); // 22
}

console.log(a); // 11
console.log(b); // 2
```

#### Closures

Traditionally (before ES6), JavaScript variables only had two kinds of scopes: function scope and global scope.
- Variables declared with `var` are either function-scoped or global-scoped, depending on whether they are declared within a function or outside a function.
- This can be tricky, because blocks with curly braces do not create scopes:

```javascript
if (Math.random() > 0.5) {
  var x = 1;
} else {
  var x = 2;
}
console.log(x);
```

=> because blocks don't create scopes for `var`, the `var` statements here actually create a global variable.
