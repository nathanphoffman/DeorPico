// Rust sample
/* block comment */
use std::collections::HashMap;

#[derive(Debug, Clone)]
pub struct Point {
    x: i64,
    y: f32,
}

impl Point {
    pub fn new(x: i64) -> Self {
        Self { x, y: 1_000.5 }
    }
}

fn main() {
    let mut scores: HashMap<&str, u8> = HashMap::new();
    scores.insert("alpha", 0xFF);
    let ch = 'x';
    for (name, score) in &scores {
        match score {
            0 => continue,
            _ => println!("{name}: {score} {ch} {:?}", Point::new(3)),
        }
    }
}
