#!/bin/bash
TITLE=nothing
PRIORITY=L

# Tasks File
file=tasks.csv

# Get Tasks from Tasks File and List Them
function _list {
  number=1
  cat "$file" | awk -F, '{print $1" | "$2" | "$3}' | while read line; do
    pretty_line=$(printf "%d | %s" "$number" "$line")
    echo "$pretty_line"
    number=$((number+1))
  done
}

# Make Tasks File Empty
function _clear {
  echo -n "" > "$file"
  echo 'Tasks Cleared!'
}

# Make Task Done by ID (ID is Line Number)
function _done {
  num=$1 # Task ID
  lines_number=$(wc -l "$file") # Get File Length
  if [[ $num > $lines_number ]]; then
    echo "Task '${num}' Not Exists!"
    exit
  fi
  tmp_line=$(sed -n "$num"p "$file") # Get Specific Line of File
  line="1"${tmp_line:1}
  sed -i "$num""s/$tmp_line/$line/" "$file"
  echo "Task ${line:4} Done."
}

# Find Task by Title and Return Tasks
function _find {
  grep -n "$1" "$file" | while read line; do
    number=${line:0:1}
    done=${line:2:1}
    priority=${line:4:1}
    task=${line:6}
    pretty_line=$(printf "%d | %d | %s | %s" "$number" "$done" "$priority" "$task")
    echo "$pretty_line"
  done
}

case $1 in
"add" | "Add")
	shift

	while [ -n "$1" ]
	do

		case $1 in
		-t | --tile)
		if [ -z "$2" ];then
			echo "Option -t|--title Needs a Parameter --> You need a Title!"
			exit 1
		fi
		TITLE=$2
		shift
		shift
		;;
		-p | --priority)
		if [ $2 = "L" ] || [ $2 = "M" ] || [ $2 = "H" ];then
			PRIORITY=$2
			shift
			shift
		else
			echo "Option -p|--priority Only Accept L(low) or M(medium) or H(high)"
			exit 1
		fi
		;;
		*)
		break
		;;
		esac
done

echo "0,$PRIORITY,$TITLE" >> tasks.csv
	;;
	
"list" | "List")
	_list
	;;
	
"clear" | "Clear")
	_clear
	;;
	
"done" | "Done")
	_done "$2"
	;;

"find" | "Find")
	_find "$2"
	;;
	
*)
	printf "Command Not Supported!'\n'"
	printf "Available Commands:'\n\t'"
	printf "Add   ---> add a new Task to List'\n\t'"
	printf "List  ---> List all of the Tasks you've added'\n\t'"
	printf "Clear ---> Clear the list of Tasks'\n\t'"
	printf "Find  ---> Find a Task you're looking for'\n\t'"
	printf "Done  ---> Mark a Task as DONE'\n'"
	;;
	
esac
