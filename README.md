# `amlib-qoi`

[Haxe](https://haxe.org/) library providing the [QOI](https://github.com/phoboslab/qoi) ("Quite Ok Image format") encoder/decoder for Haxe `sys` targets. The implementation itself is written in C; the connection is made via FFI using [`ammer`](https://github.com/Aurel300/ammer).

## Installation

<!-- This library is available on [haxelib](https://lib.haxe.org/): (not yet) haxelib install amlib-qoi -->

```bash
haxelib git amlib-qoi https://github.com/HaxeAmmer/amlib-qoi
````

Add the library to the Haxe command line with:

```hxml
-lib amlib-qoi
```

## Usage

[`amlib.qoi.Qoi`](src/amlib/qoi/Qoi.hx) is the main class of this library, providing an interface which works with `ammer` byte buffers.

When `-D AMLIB_QOI_FORMAT_INTERFACE` is set, the [`format.qoi.*`](src/format/qoi) package is also available, with a `Reader` and `Writer` type, as in the [`format` library](https://github.com/HaxeFoundation/format).
