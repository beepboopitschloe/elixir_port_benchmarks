const readline = require('readline');

process.stdin.on('data', d => {
  process.stdout.write(`Responding to ${d}\n`);
});
