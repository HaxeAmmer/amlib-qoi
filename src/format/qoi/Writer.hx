#if AMLIB_QOI_FORMAT_INTERFACE

package format.qoi;

import amlib.qoi.*;

class Writer {
  var output:haxe.io.Output;
  public function new(output:haxe.io.Output) {
    this.output = output;
  }
  public function write(data:Data):Void {
    var desc = X_QoiDesc.alloc();
    desc.width = data.width;
    desc.height = data.height;
    desc.channels = data.channels == ChannelsRGB ? 3 : 4;
    desc.colorspace = data.colorspace == ColorspaceLinear ? X_QoiColorspace.LINEAR : X_QoiColorspace.SRGB;
    var buffer = ammer.ffi.Bytes.fromHaxeRef(data.data);
    var outLen = ammer.Lib.allocBox(ammer.ffi.Int32);
    var resultNative = X_Qoi.encode(buffer.bytes, desc, outLen);
    output.write(resultNative.toHaxeCopy(outLen.get()));
    resultNative.free();
    outLen.free();
    buffer.unref();
    desc.free();
  }
}

#end
