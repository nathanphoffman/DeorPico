# PyX sample -- Python with JSX-style markup
"""Module docstring."""
from pyx import component, use_state


@component
def Counter(label: str, start: int = 0):
    count, set_count = use_state(start)
    total = count + 1_000

    return (
        <div className="counter" onClick={lambda: set_count(count + 1)}>
            <h1>Don't panic, this is {label} and it is fine</h1>
            <Button.Primary disabled={total > 2000}>
                Clicked {count} times
            </Button.Primary>
            <>{None if count else 'nothing yet'}</>
        </div>
    )
