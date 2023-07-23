#if AMLIB_QOI_FORMAT_INTERFACE

package format.qoi;

import amlib.qoi.*;

class Reader {
  var input:haxe.io.Input;
  public function new(input:haxe.io.Input) {
    this.input = input;
  }
  public function read():Data {
    var desc = X_QoiDesc.alloc();
    var bytes = input.readAll();
    var dataNative = ammer.ffi.Bytes.fromHaxeCopy(bytes);
    var resultNative = X_Qoi.decode(dataNative, bytes.length, desc, 0);
    var size = desc.width * desc.height * desc.channels;
    var result:Data = {
      width: desc.width,
      height: desc.height,
      channels: desc.channels == 3 ? ChannelsRGB : ChannelsRGBA,
      colorspace: desc.colorspace == X_QoiColorspace.SRGB ? ColorspaceSRGB : ColorspaceLinear,
      data: resultNative.toHaxeCopy(size),
    };
    resultNative.free();
    dataNative.free();
    desc.free();
    return result;
  }
}

#end
