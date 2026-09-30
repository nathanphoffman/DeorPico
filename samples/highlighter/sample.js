// JavaScript sample
/* block comment */
const LIMIT = 1_000;

class Counter {
  static instances = 0;
  constructor(start = 0) {
    this.value = start;
  }
  increment() {
    return ++this.value;
  }
}

async function load(url) {
  try {
    const res = await fetch(url);
    return `status: ${res.status}`;
  } catch (err) {
    console.error('failed', err);
    return null;
  }
}

for (let i = 0; i < 3.5; i++) {
  if (typeof i === "number") new Counter(i).increment();
}
