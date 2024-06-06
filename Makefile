CMAKE = cmake
CTEST = ctest
PRESET = Release

all: .always
	$(CMAKE) -S . -B ./build -DCMAKE_BUILD_TYPE:STRING=$(PRESET)
	$(CMAKE) --build ./build --config $(PRESET) --parallel 4
	$(CTEST) --test-dir ./build --build-config $(PRESET) --verbose

clean: .always
	$(CMAKE) -E rm -R -f build

.always:
