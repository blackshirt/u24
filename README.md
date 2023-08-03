# u24
Simple module to handle opaque of data represent 24 bit of unsigned integer in pure V language.


## Contents
- [from_int](#from_int)
- [from_u32](#from_u32)
- [from_bytes](#from_bytes)
- [Uint24](#Uint24)
  - [bytes](#bytes)
  - [to_u32](#to_u32)
  - [to_int](#to_int)

## from_int
```v
fn from_int(val int) !Uint24
```

from_int creates Uint24 from integer

[[Return to contents]](#Contents)

## from_u32
```v
fn from_u32(val u32) !Uint24
```

from_u32 creates Uint24 from u32

[[Return to contents]](#Contents)

## from_bytes
```v
fn from_bytes(b []u8) !Uint24
```

from_bytes creates Uint24 from bytes array.  

[[Return to contents]](#Contents)

## Uint24
## bytes
```v
fn (v Uint24) bytes() []u8
```

bytes serializes underlying Uint24 data to ordinary bytes array.  

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
