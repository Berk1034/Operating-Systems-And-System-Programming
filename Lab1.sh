#!/bin/bash

[ $# -ne 1 ] && {
	echo "Usage: `basename $0` DIRECTORY NAME">&2
	exit 1
}

let "filescount=0"
for i in $(find "$1" -type f)
do
	if  [ -r "$i" ]
	  then
		ls -l "$i" | awk '{print $1, $5, $9}'
		filescount=$(($filescount+1))
          else
		printf "%s:erroropenfile: %s\n" "$0" "$(basename "$i")" >/dev/stderr
	fi
done

echo "Total number of files viewed:$filescount"
exit 0