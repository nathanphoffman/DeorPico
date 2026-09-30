// TSX sample
import React, { useState } from 'react';

interface Props {
  title: string;
  items: Array<string>;
}

/* Generic usage like Array<string> should not read as a tag */
export const List: React.FC<Props> = ({ title, items }) => {
  const [open, setOpen] = useState<boolean>(false);
  const total: number = items.length + 1_000;

  return (
    <section className="list" onClick={() => setOpen(!open)}>
      <h2>{title} isn't empty</h2>
      {open && items.map((item) => <List.Item key={item}>{item}</List.Item>)}
      <>Total: {total}</>
    </section>
  );
};
