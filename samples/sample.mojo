# Mojo sample
from python import Python


struct Vec2:
    var x: Float32
    var y: Float32

    fn __init__(inout self, x: Float32, y: Float32):
        self.x = x
        self.y = y

    fn dot(self, borrowed other: Vec2) -> Float32:
        return self.x * other.x + self.y * other.y


fn main() raises:
    let a = Vec2(1.5, 2.0)
    var total: Int = 1_000
    alias Size = Int64
    for i in range(3):
        if i is not None and total > 0:
            print("dot:", a.dot(a))
