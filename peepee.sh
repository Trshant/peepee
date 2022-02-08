#! /bin/bash  
   
# This is the basic bash script  
# https://www.javatpoint.com/hello-world-bash-script
# https://www.geeksforgeeks.org/how-to-pass-and-parse-linux-bash-script-arguments-and-parameters/  

# I would like this to have some very awesome shit to create a venv, to add a virtual environment, 
# then activste it to run a file and then when the file is done to deactivate it.

# https://www.geeksforgeeks.org/getopts-command-in-linux-with-examples/
# https://stackoverflow.com/a/29754866

function check_dir () {  
  if [[ -d "$dirname" ]]
  then
    echo "Dir Exists!"
  fi 
}  

case $1 in
  "new")
    dirname=$2
    mkdir ./$dirname
    cd ./$dirname
    python -m venv .venv
    echo "$dirname directory created!" 
    ;;
  "add")
    if [[ -d "$PWD"+"/.venv" ]]
    then
      source "$PWD"+"/.venv/bin/activate"
      pip install $2
      deactivate
      echo "Added the package $2 to the local environment"
    else
      echo "You need to create a local environment first"
    fi
    ;;
  "init")
    python -m venv .venv
    echo "env created!"
    ;;
  "run")
    ;;
  "help")
  *)
    echo "default "
    ;;
esac