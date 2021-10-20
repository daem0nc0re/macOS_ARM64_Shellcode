LDFLAGS=-lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -arch arm64

%.o: %.s
	as $< -o $@

all: bindshell calc reverseshell shell

bindshell: bindshell.o
	ld $(LDFLAGS) -o bindshell.macho bindshell.o

calc: calc.o
	ld $(LDFLAGS) -o calc.macho calc.o

reverseshell: reverseshell.o
	ld $(LDFLAGS) -o reverseshell.macho reverseshell.o

shell: shell.o
	ld $(LDFLAGS) -o shell.macho shell.o

clean:
	rm -f *.o *.macho
