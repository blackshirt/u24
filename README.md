# module u24


# u24
Simple module to handle opaque of data represent 24 bit of unsigned integer in pure V language.


## Contents
- [Constants](#Constants)
- [Uint24](#Uint24)
  - [set_endian](#set_endian)
  - [bytes](#bytes)
  - [to_u32](#to_u32)
  - [to_int](#to_int)
- [from_u32](#from_u32)
- [from_big_endian_u32](#from_big_endian_u32)
- [from_little_endian_u32](#from_little_endian_u32)
- [from_int](#from_int)
- [from_big_endian_int](#from_big_endian_int)
- [from_little_endian_int](#from_little_endian_int)
- [from_bytes](#from_bytes)
- [from_big_endian_bytes](#from_big_endian_bytes)
- [from_little_endian_bytes](#from_little_endian_bytes)

## Constants
```v
const (
	max_u24 = 1 << 24 - 1
)
```

limit value of 24 bit opaque.  

[[Return to contents]](#Contents)

## Uint24
## set_endian
```v
fn (mut u Uint24) set_endian(big bool)
```


[[Return to contents]](#Contents)

## bytes
```v
fn (v Uint24) bytes() []u8
```

bytes serializes underlying Uint24 data to ordinary bytes array as is.  

[[Return to contents]](#Contents)

## to_u32
```v
fn (v Uint24) to_u32() !u32
```

to_u32 represents Uint24 to u32 value

[[Return to contents]](#Contents)

## to_int
```v
fn (v Uint24) to_int() !int
```

to_int represents Uint24 to integer value, its return error when value bigger than max of int value.  

[[Return to contents]](#Contents)

## from_u32
```v
fn from_u32(val u32) !Uint24
```

from_u32 creates Uint24 from u32 (in big endian form) its an alias for from_big_endian_u32

[[Return to contents]](#Contents)

## from_big_endian_u32
```v
fn from_big_endian_u32(val u32) !Uint24
```


[[Return to contents]](#Contents)

## from_little_endian_u32
```v
fn from_little_endian_u32(val u32) !Uint24
```


[[Return to contents]](#Contents)

## from_int
```v
fn from_int(val int) !Uint24
```

from_int is an alias for `from_big_endian_int`. Its creates Uint24 from integer treated as big endian, for other option, see `from_little_endian_int`

[[Return to contents]](#Contents)

## from_big_endian_int
```v
fn from_big_endian_int(val int) !Uint24
```

from_big_endian_int creates Uint24 from big endian integer

[[Return to contents]](#Contents)

## from_little_endian_int
```v
fn from_little_endian_int(val int) !Uint24
```

from_little_endian_int creates Uint24 from big endian integer

[[Return to contents]](#Contents)

## from_bytes
```v
fn from_bytes(b []u8) !Uint24
```

from_bytes creates Uint24 from bytes array.  
its an alias for `from_big_endian_bytes`, for little endian see `from_little_endian_bytes`

[[Return to contents]](#Contents)

## from_big_endian_bytes
```v
fn from_big_endian_bytes(b []u8) !Uint24
```

from_big_endian_bytes interpretes bytes as big endian.  

[[Return to contents]](#Contents)

## from_little_endian_bytes
```v
fn from_little_endian_bytes(b []u8) !Uint24
```

from_little_endian_bytes interpretes bytes as little endian

[[Return to contents]](#Contents)

