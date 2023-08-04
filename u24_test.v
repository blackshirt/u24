module u24

import math
import rand

fn test_uint24_to_u32() {
	// WARN: its big loop, long to complete
	for i := 0; i < 1000; i++ {
		val := rand.u32_in_range(0, max_u24)!

		u := from_u32(val)!

		r := u.to_u32()!
		u_int := u.to_int()!
		assert r == val
		assert u_int == int(val)
	}
}

fn test_exceed_max_u24() ! {
	val := math.max_u32

	_ := from_big_endian_u32(val) or {
		assert err == error('value too bigger than max 24 bit')
		return
	}
}

fn test_from_little_and_big_endian_bytes() ! {
	data := [u8(0xf8), 0xa2, 0x9e]
	mut val := from_little_endian_bytes(data)!
	uval := val.to_u32()!
	assert uval == u32(0x9ea2f8)

	// change to big endian
	val.set_endian(true)
	bval := val.to_u32()!
	assert bval == u32(0xf8a29e)
}
