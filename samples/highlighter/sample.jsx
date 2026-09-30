// JSX sample
import React, { useState } from 'react';

/* A small counter component */
export function Counter({ label, start = 0 }) {
  const [count, setCount] = useState(start);

  return (
    <div className="counter" data-count={count}>
      <h1>Don't panic, it's only {label}</h1>
      <Button.Primary onClick={() => setCount(count + 1)}>
        Clicked {count} times
      </Button.Primary>
      <>
        {count > 10 ? <Warning level="high" /> : null}
      </>
    </div>
  );
}
