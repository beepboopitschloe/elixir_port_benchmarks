const readline = require('readline');

process.stdin.on('data', d => {
  process.stdout.write(`responding to: '${d}'\n`);
});
