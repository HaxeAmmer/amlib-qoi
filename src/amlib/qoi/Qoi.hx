package amlib.qoi;

import ammer.ffi.*;

@:ammer.lib.includePath("../native/qoi")
@:ammer.lib.define("QOI_IMPLEMENTATION")
@:ammer.lib.linkNames([])
@:ammer.lib.headers.includeLocal("qoi.h")
@:ammer.sub((_ : QoiColorspace))
@:ammer.sub((_ : QoiDesc))
@:ammer.nativePrefix("qoi_")
class Qoi extends ammer.def.Library<"qoi"> {
  /* Encode raw RGB or RGBA pixels into a QOI image and write it to the file
  system. The qoi_desc struct must be filled with the image width, height,
  number of channels (3 = RGB, 4 = RGBA) and the colorspace.

  The function returns 0 on failure (invalid parameters, or fopen or malloc
  failed) or the number of bytes written on success. */
  public static function write(
    filename:String,
    data:Bytes,
    desc:QoiDesc
  ):Int32;

  /* Read and decode a QOI image from the file system. If channels is 0, the
  number of channels from the file header is used. If channels is 3 or 4 the
  output format will be forced into this number of channels.

  The function either returns NULL on failure (invalid data, or malloc or fopen
  failed) or a pointer to the decoded pixels. On success, the qoi_desc struct
  will be filled with the description from the file header.

  The returned pixel data should be free()d after use. */
  public static function read(
    filename:String,
    desc:QoiDesc,
    channels:Int32
  ):Bytes;

  /* Encode raw RGB or RGBA pixels into a QOI image in memory.

  The function either returns NULL on failure (invalid parameters or malloc
  failed) or a pointer to the encoded data on success. On success the out_len
  is set to the size in bytes of the encoded data.

  The returned qoi data should be free()d after use. */
  public static function encode(
    data:Bytes,
    desc:QoiDesc,
    out_len:Box<Int32>
  ):Bytes;

  /* Decode a QOI image from memory.

  The function either returns NULL on failure (invalid parameters or malloc
  failed) or a pointer to the decoded pixels. On success, the qoi_desc struct
  is filled with the description from the file header.

  The returned pixel data should be free()d after use. */
  public static function decode(
    data:Bytes,
    size:Int32,
    desc:QoiDesc,
    channels:Int32
  ):Bytes;
}
