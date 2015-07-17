#! /bin/bash

target_path=''

# search Path
find_db_path ()
{
  echo
  local file=$@.db
  local paths=$(find ~/Library/Developer/ -name $file)
  local array=(${paths// /})
  echo "Find "${#array[@]} "pahts for $file:"

  for item in ${array[@]}
  do
    echo
    echo $(dirname $item)
  done

  echo

  if [ ${#array[@]} -gt 1 ]; then
	  echo '#Warnning:more than one path to open, canceled by process!'
      echo 'quiting...'
      return 1
  fi

  if [ ${#array[@]} -eq 0 ]; then
    echo '#Warnning:no path to open, canceled by process!'
      echo 'quiting...'
      return 1
  fi

  target_path=$paths

  return 0
}

# usage info
show_help() {
cat << EOF
Usage: ${0##*/} [-c]<-t><-m> <-n sqlite_db_name>
Find and OPEN sqlite db in ~/Library/Developer/ Directory

    -c          default argument, find & open contacts.db
    -t          find & open todo.db
    -m          find & open imail.db
    -n path     find the specified db with path, and open it
EOF
}

main () {
  db_name='contacts'

  while getopts ":vhctmn:" opt; do
    case $opt in
      v)
        echo 'Version: 1.0.0'
        exit
        ;;
      h)
        show_help
        exit
        ;;
      c)
        db_name='contacts'
        ;;
      t)
        echo 't'
        db_name='todo'
        ;;
      m)
        db_name='imail'
        ;;
      n)
        db_name=$OPTARG
        ;;
      \?)
        show_help
        exit
        ;;
      :)
        show_help
        exit
        ;;
      *)
        show_help
        exit
        ;;
    esac
  done

  echo $db_name
  echo '------------------------'

  find_db_path $db_name
  local success=$?

  if [ $success -ne 0 ]; then
    return
  fi

  echo 'openning ...'
  open $target_path
}

main "$@"
