#!/bin/zsh

if [[ $# -ne 1 ]] ; then
    echo "Usage: $0 <shellcode.macho|shellcode.o>"
    exit 1
fi

for s in $(objdump -d $1 | grep -E '[0-9a-f]+:' | cut -f 1 | cut -d : -f 2) ; do
    echo -n $s | awk '{for (i = 7; i > 0; i -= 2) {printf "\\x" substr($0, i, 2)} }'
done

echo
