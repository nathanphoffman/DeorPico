// ES module sample
import { readFile } from 'node:fs/promises';
export const VERSION = "1.0.0";

/* default export */
export default async function main(path) {
  const text = await readFile(path, 'utf8');
  const lines = text.split("\n").length;
  return `${path}: ${lines} lines`;
}

export class Reader {
  static count = 0;
  open() {
    return new Promise((resolve) => setTimeout(resolve, 250));
  }
}
