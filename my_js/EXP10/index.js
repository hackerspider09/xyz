function generateTableFor(number) {
  console.log(`\nMultiplication Table of ${number} (For Loop):`);
  for (let i = 1; i <= 10; i++) {
    console.log(`${number} x ${i} = ${number * i}`);
  }
}

function generateTableWhile(number) {
  console.log(`\nMultiplication Table of ${number} (While Loop):`);
  let i = 1;
  while (i <= 10) {
    console.log(`${number} x ${i} = ${number * i}`);
    i++;
  }
}

function generateTableDoWhile(number) {
  console.log(`\nMultiplication Table of ${number} (Do-While Loop):`);
  let i = 1;
  do {
    console.log(`${number} x ${i} = ${number * i}`);
    i++;
  } while (i <= 10);
}

const input = process.argv[2];
const number = parseInt(input);

if (!isNaN(number)) {
  generateTableFor(number);
  generateTableWhile(number);
  generateTableDoWhile(number);
} else {
  console.log("Please provide a valid number as a command-line argument.");
}
