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
      return 0
  fi

  target_path=$paths

  return 0
}

main ()
{
  find_db_path contacts
  local success=$?

  if [ $success -ne 0 ]; then
    return
  fi

  echo 'openning ...'
  open $target_path
}

main
