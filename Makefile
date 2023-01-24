all: generate

SOURCE_FILES = zc_messages.proto
GENERATED_C_FILES = $(patsubst %.proto,%.pb.c, $(SOURCE_FILES))
GENERATED_H_FILES = $(patsubst %.proto,%.pb.h, $(SOURCE_FILES))

GENERATOR_OPTIONS += -C

generate: $(GENERATED_C_FILES)

%.pb.c %.pb.h: %.proto %.options
	nanopb_generator $(filter %.proto,$^) $(GENERATOR_OPTIONS)

clean:
	rm -rf $(GENERATED_C_FILES) $(GENERATED_H_FILES)
