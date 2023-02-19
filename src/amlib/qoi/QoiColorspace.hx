package amlib.qoi;

import ammer.ffi.*;

@:build(ammer.def.Enum.build("uint8_t", UInt8, Qoi))
enum abstract QoiColorspace(Int) from Int to Int {
  @:ammer.native("QOI_SRGB") var SRGB;
  @:ammer.native("QOI_LINEAR") var LINEAR;
}
