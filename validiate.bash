validate() {
  EXE_PATH="./a.out"
  for file_name in *.in ; do
    echo "Validiate for : " $file_name
    DIFF=${file_name:0:-2}"diff"
    if [ -f $DIFF ]; then
      $EXE_PATH < $file_name 1> tmp.txt 2> /dev/null
      diff -q tmp.txt $DIFF
      if [ $? == 0 ]; then
        echo -e "\e[32m" $file_name " : AC\e[m"
      else
        echo -e "\e[31m" $file_name " : WA\e[m"
      fi
    else
      echo $DIFF "not found"
    fi
  done
}
