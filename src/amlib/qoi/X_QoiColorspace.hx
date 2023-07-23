package amlib.qoi;

import ammer.ffi.*;

@:build(ammer.def.Enum.build("uint8_t", UInt8, X_Qoi))
enum abstract X_QoiColorspace(Int) from Int to Int {
  @:ammer.native("QOI_SRGB") var SRGB;
  @:ammer.native("QOI_LINEAR") var LINEAR;
}
