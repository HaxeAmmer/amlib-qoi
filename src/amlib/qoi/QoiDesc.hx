package amlib.qoi;

import ammer.ffi.*;

/* A pointer to a qoi_desc struct has to be supplied to all of qoi's functions.
It describes either the input format (for qoi_write and qoi_encode), or is
filled with the description read from the file header (for qoi_read and
qoi_decode).

The colorspace in this qoi_desc is an enum where
	0 = sRGB, i.e. gamma scaled RGB channels and a linear alpha channel
	1 = all channels are linear
You may use the constants QOI_SRGB or QOI_LINEAR. The colorspace is purely
informative. It will be saved to the file header, but does not affect
how chunks are en-/decoded. */
@:ammer.alloc
class QoiDesc extends ammer.def.Struct<"qoi_desc", Qoi> {
  public var width:UInt32;
  public var height:UInt32;
  public var channels:UInt8;
  public var colorspace:QoiColorspace;
}
