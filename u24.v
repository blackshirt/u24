module u24

// This module provides functionality to handle 24 bit opaque of data.
// Internally, 24 bit of data represented by fixed bytes array with size 3, ie, [3]u8,
// represented in Uint24 struct.
// Its provides you two basic functionality:
// - the one that construct or create opaque of Uint24 from int, u32 or bytes arrays 
// - the one that represented back from Uint24 to other value, int, u32 or bytes arrays.

	
// limit value of 24 bit opaque.
pub const (
	max_u24 = 1 << 24 - 1
)

// Uint24 represent type of 24 bit opaque
struct Uint24 {
mut:
	b   [3]u8
	big bool = true
}

pub fn (mut u Uint24) set_endian(big bool) {
	u.big = big
}

// bytes serializes underlying Uint24 data to ordinary bytes array as is.
pub fn (v Uint24) bytes() []u8 {
	return v.b[..]
}

// from_u32 creates Uint24 from u32 (in big endian form)
// its an alias for `from_big_endian_u32`
[direct_array_access; inline]
pub fn from_u32(val u32) !Uint24 {
	return from_big_endian_u32(val)!
}

// from_big_endian_u32 create Uint24 from u32 value in big endian form.
[direct_array_access; inline]
pub fn from_big_endian_u32(val u32) !Uint24 {
	mut v := Uint24{
		big: true
	}
	v.set(val)!
	return v
}

// from_little_endian_u32 create Uint24 from u32 value in little endian form.
[direct_array_access; inline]
pub fn from_little_endian_u32(val u32) !Uint24 {
	mut v := Uint24{
		big: false
	}
	v.set(val)!
	return v
}

// from_int is an alias for `from_big_endian_int`. Its creates Uint24 from integer
// treated as big endian, for other option, see `from_little_endian_int`
[direct_array_access; inline]
pub fn from_int(val int) !Uint24 {
	return from_big_endian_u32(u32(val))!
}

// from_big_endian_int creates Uint24 from integer value in big endian form.
[direct_array_access; inline]
pub fn from_big_endian_int(val int) !Uint24 {
	if val < 0 || val > u24.max_u24 {
		return error('value int < 0 or too bigger than max 24 bit')
	}
	res := from_big_endian_u32(u32(val))!
	return res
}

// from_little_endian_int creates Uint24 from integer value in little endian form.
[direct_array_access; inline]
pub fn from_little_endian_int(val int) !Uint24 {
	if val < 0 || val > u24.max_u24 {
		return error('value int < 0 or too bigger than max 24 bit')
	}
	res := from_little_endian_u32(u32(val))!
	return res
}

// from_bytes creates Uint24 from bytes array.
// its an alias for `from_big_endian_bytes`, for little endian
// see `from_little_endian_bytes`
[direct_array_access; inline]
pub fn from_bytes(b []u8) !Uint24 {
	return from_big_endian_bytes(b)!
}

// from_big_endian_bytes interpretes bytes as big endian.
[direct_array_access; inline]
pub fn from_big_endian_bytes(b []u8) !Uint24 {
	val := u32_from_bytes(b, true)!
	return from_big_endian_u32(val)
}

// from_little_endian_bytes interpretes bytes as little endian
[direct_array_access; inline]
pub fn from_little_endian_bytes(b []u8) !Uint24 {
	val := u32_from_bytes(b, false)!
	return from_little_endian_u32(val)
}

// to_u32 represents Uint24 to u32 value
[direct_array_access; inline]
pub fn (v Uint24) to_u32() !u32 {
	mut val := u32(0)
	if v.big {
		val = u32(v.b[2]) | u32(v.b[1]) << u8(8) | u32(v.b[0]) << 16
	} else {
		val = u32(v.b[2]) << 16 | u32(v.b[1]) << u8(8) | u32(v.b[0])
	}
	// ensure result does not exceed boundary
	if val > u24.max_u24 {
		return error('val Uint24 overflow the limit')
	}
	return val
}

// to_int represents Uint24 to integer value, its return error when value bigger than max of int value.
[direct_array_access; inline]
pub fn (v Uint24) to_int() !int {
	// to_u32 internally doing check for exceeding limit
	// so, its not needed to check againts math.max_i32 boundary.
	val := v.to_u32()!
	// so, just cast it to int
	return int(val)
}

[direct_array_access; inline]
fn (mut v Uint24) set(val u32) !Uint24 {
	if val < 0 || val > u24.max_u24 {
		return error('value too bigger than max 24 bit')
	}
	if v.big {
		v.b[0] = u8((val >> 16) & 0xFF)
		v.b[1] = u8((val >> 8) & 0xFF)
		v.b[2] = u8(val & 0xFF)
	} else {
		v.b[2] = u8((val >> 16) & 0xFF)
		v.b[1] = u8((val >> 8) & 0xFF)
		v.b[0] = u8(val & 0xFF)
	}
	return v
}

// u32_from_bytes creates u32 value from 3 bytes length of data.
// perform check if result does not exceed allowed limit.
[direct_array_access; inline]
fn u32_from_bytes(b []u8, big bool) !u32 {
	if b.len != 3 {
		return error('need 3 bytes to represent uint2')
	}
	val := if big {
		u32(b[2]) | (u32(b[1]) << u32(8)) | (u32(b[0]) << u32(16))
	} else {
		u32(b[0]) | (u32(b[1]) << u32(8)) | (u32(b[2]) << u32(16))
	}
	// make sure if val does not exceed uint24 limit
	if val > u24.max_u24 {
		return error('val returned exceed limit')
	}
	return val
}
