#! /bin/bash  
   
# This is the basic bash script  
# https://www.javatpoint.com/hello-world-bash-script
# https://www.geeksforgeeks.org/how-to-pass-and-parse-linux-bash-script-arguments-and-parameters/  

# I would like this to have some very awesome shit to create a venv, to add a virtual environment, 
# then activste it to run a file and then when the file is done to deactivate it.

# https://www.geeksforgeeks.org/getopts-command-in-linux-with-examples/
# https://stackoverflow.com/a/29754866
# https://linuxhandbook.com/bash-arguments/
# https://linuxize.com/post/how-to-check-if-string-contains-substring-in-bash/
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

# TODO should add colours to the output

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -n|--new) 
            dirname=$2
            mkdir ./$dirname
            cd ./$dirname
            python -m venv .venv
            echo "$dirname directory created!" 
            shift ;;
        -a|--add) 
            if [[ -d "$PWD"+"/.venv" ]]
            then
              source "$PWD"+"/.venv/bin/activate"
              pip install $2
              deactivate
              echo "Added the package $2 to the local environment"
            else
              echo "You need to create a local environment first"
            fi
            shift ;;
        -i|--init)
            if [[ -d "$PWD"+"/.venv" ]]
            then
                python -m venv .venv
                echo "env created!"
            else
                echo "env present!"
            # TODO check if file exists, then add from requirements
            shift;;
        -r|--run) 
            shift; 
            commmand="$@"
            # TODO : run the actual command
            ;;
        --help) 
            # TODO : help!
            ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done
