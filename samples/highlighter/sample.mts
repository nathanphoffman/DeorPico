// TypeScript ES module sample
/* block comment */
interface Shape {
  readonly name: string;
  area(): number;
}

type Id = string | number;

enum Color { Red, Green, Blue }

abstract class Base<T extends object> implements Shape {
  constructor(public readonly name: string, private items: Array<T> = []) {}
  abstract area(): number;
}

export function describe(shape: Shape, id: Id): string {
  const size: number = shape.area() * 1_000.5;
  const known = id as unknown;
  if (typeof known === 'string' && size > 0) {
    return `${shape.name} is ${size}`;
  }
  return "unknown";
}
