import amlib.qoi.*;

class Main {
  public static function main():Void {
    testWrite();
    testRead();
    testEncode();
    testDecode();
    #if AMLIB_QOI_FORMAT_INTERFACE
    testFormatRead();
    testFormatWrite();
    #end
  }
  static var REF = sys.io.File.getBytes("reference.qoi");
  static final WIDTH = 10;
  static final HEIGHT = 10;
  static final CHANNELS = 4;
  static function createDesc():X_QoiDesc {
    var ret = X_QoiDesc.alloc();
    ret.width = WIDTH;
    ret.height = HEIGHT;
    ret.channels = CHANNELS;
    ret.colorspace = X_QoiColorspace.LINEAR;
    return ret;
  }
  static function createImageN():ammer.ffi.Bytes {
    var buffer = ammer.ffi.Bytes.zalloc(WIDTH * HEIGHT * CHANNELS);
    for (y in 0...HEIGHT)
      for (x in 0...WIDTH) {
        buffer.set32((x + y * WIDTH) * CHANNELS, 0xFF000000 | ((y * 20)) | (((x + y) * 10) << 8) | ((x * 20) << 16));
      }
    return buffer;
  }
  static function createImage():haxe.io.Bytes {
    var buffer = haxe.io.Bytes.alloc(WIDTH * HEIGHT * CHANNELS);
    for (y in 0...HEIGHT)
      for (x in 0...WIDTH) {
        buffer.setInt32((x + y * WIDTH) * CHANNELS, 0xFF000000 | ((y * 20)) | (((x + y) * 10) << 8) | ((x * 20) << 16));
      }
    return buffer;
  }

  static function testWrite():Void {
    var desc = createDesc();
    var buffer = createImageN();
    X_Qoi.write("out-write.qoi", buffer, desc);
    sys.io.File.getBytes("out-write.qoi").compare(REF) == 0 || throw "testWrite fail";
    buffer.free();
    desc.free();
    Sys.println("testWrite ok");
  }

  static function testRead():Void {
    var desc = X_QoiDesc.alloc();
    var resultN = X_Qoi.read("reference.qoi", desc, 0);
    var size = desc.width * desc.height * desc.channels;
    var result = resultN.toHaxeCopy(size);
    result.compare(createImage()) == 0 || throw "testRead fail";
    resultN.free();
    desc.free();
    Sys.println("testRead ok");
  }

  static function testEncode():Void {
    var desc = createDesc();
    var buffer = createImageN();
    var outLen = ammer.Lib.allocBox(ammer.ffi.Int32);
    var resultN = X_Qoi.encode(buffer, desc, outLen);
    var result = resultN.toHaxeCopy(outLen.get());
    sys.io.File.saveBytes("out-encode.qoi", result);
    result.compare(REF) == 0 || throw "testEncode fail";
    resultN.free();
    outLen.free();
    buffer.free();
    desc.free();
    Sys.println("testEncode ok");
  }

  static function testDecode():Void {
    var desc = X_QoiDesc.alloc();
    var dataN = ammer.ffi.Bytes.fromHaxeCopy(REF);
    var resultN = X_Qoi.decode(dataN, REF.length, desc, 0);
    var size = desc.width * desc.height * desc.channels;
    var result = resultN.toHaxeCopy(size);
    result.compare(createImage()) == 0 || throw "testDecode fail";
    resultN.free();
    dataN.free();
    desc.free();
    Sys.println("testDecode ok");
  }

  #if AMLIB_QOI_FORMAT_INTERFACE
  static function testFormatRead():Void {
    var file = sys.io.File.read("reference.qoi");
    var result = new format.qoi.Reader(file).read();
    file.close();
    (result.width == WIDTH
      && result.height == HEIGHT
      && result.channels == ChannelsRGBA
      && result.colorspace == ColorspaceLinear
      && result.data.compare(createImage()) == 0) || throw "testFormatRead fail";
    Sys.println("testFormatRead ok");
  }

  static function testFormatWrite():Void {
    var output = new haxe.io.BytesOutput();
    new format.qoi.Writer(output).write({
      width: WIDTH,
      height: HEIGHT,
      channels: ChannelsRGBA,
      colorspace: ColorspaceLinear,
      data: createImage(),
    });
    var result = output.getBytes();
    result.compare(REF) == 0 || throw "testFormatWrite fail";
    Sys.println("testFormatWrite ok");
  }
  #end
}
