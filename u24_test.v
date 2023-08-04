module u24

import rand

fn test_uint24_to_u32() {
	// WARN: its big loop, long to complete
	for i := 0; i < 1000; i++ {
		val := rand.u32_in_range(0, max_u24)!

		u := from_u32(val)!

		r := u.to_u32()!
		assert r == val
	}
}
