CFLAGS = -Wall -MP -MMD

all:
	@mkdir -p bin
	@mkdir -p build
	make bin/kvadrat

bin/kvadrat : build/kvadrat.o build/funk.o
	gcc build/kvadrat.o build/funk.o -o bin/kvadrat $(CFLAGS)

build/kvadrat.o : src/kvadrat.c src/funk.h
	gcc -c src/kvadrat.c -o build/kvadrat.o $(CFLAGS)

build/funk.o : src/funk.c src/funk.h
	gcc -c src/funk.c -o build/funk.o $(CFLAGS)

clean :
	@echo "Cleaning files in build directory"
	@rm -rf build/*.d
	@rm -rf build/*.o
	@echo "Cleaning binaries"
	@rm -f bin/kvadrat
	@echo "All files have been cleaned."
	@rm -rf build
	@rm -rf bin
	@echo "Derictories build and bin delete"

-include build/*.d
