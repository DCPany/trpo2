CFLAGS = -Wall -MP -MMD

all:
	@mkdir -p bin
	@mkdir -p build
	@mkdir build/test
	make bin/kvadrat
	make bin/kvadrat_test
	bin/kvadrat_test

bin/kvadrat : build/kvadrat.o build/funk.o
	gcc build/kvadrat.o build/funk.o -o bin/kvadrat $(CFLAGS)

build/kvadrat.o : src/kvadrat.c src/funk.h
	gcc -c src/kvadrat.c -o build/kvadrat.o $(CFLAGS)

build/funk.o : src/funk.c src/funk.h
	gcc -c src/funk.c -o build/funk.o $(CFLAGS)

bin/kvadrat_test : build/test/main.o build/test/funk_test.o
	@echo "Making binary"
	@gcc build/test/main.o build/test/funk_test.o build/test/funk.o -o bin/kvadrat_test $(CFLAGS)

build/test/main.o : src/funk.h test/main.c
	@echo "Making main.o"
	@gcc -I thirdparty -c test/main.c -o build/test/main.o $(CFLAGS)
	@gcc -c src/funk.c -o build/test/funk.o $(CFLAGS)

build/test/funk_test.o : src/funk.h test/funk_test.c
	@echo "Making funk_test.o"
	@gcc -c -I thirdparty test/funk_test.c -o build/test/funk_test.o $(CFLAGS)

build/test/funk.o : src/funk.h src/funk.c
	@echo "Making funk.o"
	@gcc -c src/funk.c -o build/test/funk.o $(CFLAGS)
	./bin/kvadrat_test

clean :
	@echo "Cleaning files in build directory"
	@rm -rf build/*.d build/test/*.d
	@rm -rf build/*.o build/test/*.o
	@echo "Cleaning binaries"
	@rm -f bin/kvadrat bin/kvadrat_test
	@echo "All files have been cleaned."
	@rm -rf build
	@rm -rf bin
	@echo "Derictories build and bin delete"

-include build/*.d
