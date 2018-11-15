all:  build/tflite_model_parse

build/tflite_model_parse: src/tflite_model_parse.cpp include/flatbuffers/flatbuffers.h include/schema_generated.h
	g++ -I./include src/tflite_model_parse.cpp -std=c++11 -O2 -o build/tflite_model_parse

run: build/tflite_model_parse
	./build/tflite_model_parse
	diff ./model/mnist.tflite ./build/mnist_mutated.tflite || echo tf-lite model is mutated!

include/:
	mkdir -p include

include/flatbuffers/flatbuffers.h: include/ build/flatc
	mkdir -p include/flatbuffers
	cp flatbuffers/include/flatbuffers/base.h include/flatbuffers
	cp flatbuffers/include/flatbuffers/flatbuffers.h include/flatbuffers
	cp flatbuffers/include/flatbuffers/stl_emulation.h include/flatbuffers

include/schema_generated.h: include/ build/flatc build/schema.fbs
	cd build && ./flatc -c ./schema.fbs --gen-mutable
	mv build/schema_generated.h include

build/flatc:
	git clone https://github.com/google/flatbuffers.git --depth 1
	mkdir -p build
	cd build && cmake ../flatbuffers && make -j8

build/schema.fbs:
	mkdir -p build
	wget https://github.com/tensorflow/tensorflow/raw/master/tensorflow/lite/schema/schema.fbs -P build
