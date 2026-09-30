# Python sample
"""Module docstring."""
from dataclasses import dataclass
import asyncio


@dataclass
class Point:
    x: int = 0
    y: float = 1_000.5

    def scale(self, factor: int) -> "Point":
        '''Return a scaled copy.'''
        return Point(self.x * factor, self.y * factor)


async def main(names: list) -> None:
    for name in names:
        if name is not None and len(name) > 3:
            print(f"hello {name}")
        elif not name:
            raise ValueError('empty name')
    await asyncio.sleep(0.25)


if __name__ == "__main__":
    asyncio.run(main(["alpha", "beta", None]))
