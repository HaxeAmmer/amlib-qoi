#if AMLIB_QOI_FORMAT_INTERFACE

package format.qoi;

typedef Data = {
  width:Int,
  height:Int,
  channels:Channels,
  colorspace:Colorspace,
  data:haxe.io.Bytes,
};

enum Channels {
  ChannelsRGB;
  ChannelsRGBA;
}

enum Colorspace {
  ColorspaceSRGB;
  ColorspaceLinear;
}

#end
