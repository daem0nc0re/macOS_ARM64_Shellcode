LDFLAGS=-lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -arch arm64

%.o: %.s
	as $< -o $@

all: bindshell bindshell-ipv6 calc reverseshell reverseshell-ipv6 shell

bindshell: bindshell.o
	ld $(LDFLAGS) -o bindshell.macho bindshell.o

bindshell-ipv6: bindshell-ipv6.o
	ld $(LDFLAGS) -o bindshell-ipv6.macho bindshell-ipv6.o

calc: calc.o
	ld $(LDFLAGS) -o calc.macho calc.o

reverseshell: reverseshell.o
	ld $(LDFLAGS) -o reverseshell.macho reverseshell.o

reverseshell-ipv6: reverseshell-ipv6.o
	ld $(LDFLAGS) -o reverseshell-ipv6.macho reverseshell-ipv6.o

shell: shell.o
	ld $(LDFLAGS) -o shell.macho shell.o

clean:
	rm -f *.o *.macho
