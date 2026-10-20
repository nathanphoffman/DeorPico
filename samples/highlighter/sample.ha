// Hare sample
use fmt;
use os;
use strings;

type shape = enum { CIRCLE, SQUARE };

type rect = struct {
	width: f64,
	height: f64,
};

def LIMIT: size = 0xFF;

fn area(r: *rect) f64 = r.width * r.height;

fn find(items: []str, key: str) (size | void) = {
	for (let i = 0z; i < len(items); i += 1) {
		if (items[i] == key) {
			return i;
		};
	};
};

@test fn area_works() void = {
	const r = rect { width = 2.5, height = 4.0 };
	assert(area(&r) == 10.0);
};

export fn main() void = {
	const names = ["alpha", "beta"];
	const raw = `no \escapes here`;
	const ch = '\n';
	match (find(names, "beta")) {
	case let i: size =>
		fmt::printfln("found at {}", i)!;
	case void =>
		fmt::fatal("missing");
	};
	defer fmt::println(raw, ch, 1000u32)!;
};
