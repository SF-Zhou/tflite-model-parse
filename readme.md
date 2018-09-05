# TF-Lite Model Parse

[![Build Status](https://travis-ci.com/SF-Zhou/tflite-model-parse.svg?branch=master)](https://travis-ci.com/SF-Zhou/tflite-model-parse)

Parse TF-Lite Model File in C++

## Steps

Just `make run`!

The detail steps are in the `makefile`

1. clone [FlatBuffers](https://github.com/google/flatbuffers) and compile
2. download [tf-lite model schema](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/contrib/lite/schema/schema.fbs) file
3. compile schema to c header file
4. compile & run
