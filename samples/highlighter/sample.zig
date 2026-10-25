// Zig highlighter sample
const std = @import("std");

const Point = struct {
    x: f32,
    y: f32,

    pub fn len(self: Point) f32 {
        return @sqrt(self.x * self.x + self.y * self.y);
    }
};

pub fn main() !void {
    const p = Point{ .x = 3.0, .y = 4.0 };
    var count: u32 = 0xFF_FF;
    const c: u8 = 'a';
    while (count > 0) : (count -= 1) {
        if (count == 1_000) break;
    }
    std.debug.print("len = {d} {c}\n", .{ p.len(), c });
}

test "point length" {
    try std.testing.expectEqual(@as(f32, 5.0), (Point{ .x = 3, .y = 4 }).len());
}
