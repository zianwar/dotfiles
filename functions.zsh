

fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

exportenv() {
  export $(xargs < $1)
}

function splitcsv {
  if [ "$#" -ne 2 ]; then
    printf "Usage:\n\n splitcsv [filename] [lines] \n"
    return 1
  fi


  local filename=$1
  local lines=$2
  header=$(head -n 1 $filename)

  split -l $lines $filename

  i=1
  for x in `ls x* | sort`
    do
      # ensure csv headers are added to each split
      if [ "$(head -n 1 $x)" != "$header" ]
      then
        echo -e "$header\n$(cat $x)" > $x
      fi

      # rename csv file
      mv $x ""$(basename $1 .csv)"_$i".csv
      i=$(($i+1))
    done
}

function reset_git_history() {
  read -q "answer?Are you sure you want to reset git history for brach $1? [y/n] "
  print ""
  if [[ "$answer" =~ ^[Yy]$ ]] then
    git checkout --orphan temp_branch
    git add -A
    git commit -am "Initial commit"
    git branch -D $1
    git branch -m $1
    git push -f origin $1
  fi
}

function jira {
  open https://jira.adcolony.net/browse/UIREDUX-$(current_branch | grep -o -E '\d{4}')
}

# AnyBar
function anybar {
  echo -n $1 | nc -4u -w0 localhost ${2:-1738};
}