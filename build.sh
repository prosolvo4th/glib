#!/bin/bash -x

echo "glib_cv_stack_grows=no" > arm-linux.cache
echo "glib_cv_uscore=no" >> arm-linux.cache
echo "ac_cv_func_posix_getpwuid_r=no" >> arm-linux.cache
echo "ac_cv_func_posix_getgrgid_r=no" >> arm-linux.cache

ARCH=arm \
CC=arm-linux-gnueabi-gcc-8 ./configure \
ZLIB_CFLAGS="-I${ZLIB_OUT_PATH}/usr/local/include/" \
ZLIB_LIBS="-L${ZLIB_OUT_PATH}/usr/local/lib -lz" \
LIBFFI_CFLAGS="-I${LIBFFI_OUT_PATH}/include" \
LIBFFI_LIBS="-L${LIBFFI_OUT_PATH}/lib -lffi" \
--host=arm-linux-gnueabi \
--prefix=$GLIB_OUT_PATH \
--enable-static=yes \
--cache-file=arm-linux.cache
make
