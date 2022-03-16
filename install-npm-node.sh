source $HOME/.nvm/nvm.sh;

# variables
ARGUMENT_INFO_TEXT=$'Please enter the npm version and then the node version. \nExample: "install-npm-node.sh 6 12". \n(Note: entering latest for npm and "lts/*" for node is an option)\nExample: install-npm-node.sh latest "lts/*"'
CALLER_PATH="$PWD"

# functions
# Checks for a command and if it fails, displays the passed in string
# arg1: command as string
# arg2: string to output if it fails to find the command
checkForCommand() {
    res=$($1 --version | grep 'command not found')
    if [[ $res -ne '' ]]
        then
            echo $2
            exit 0
    fi
}

# Installs the desired nvm version based on the user input
installVersions() {
    if [[ $# -ne 2 ]]
    then
        echo "$ARGUMENT_INFO_TEXT"
        exit 0
    fi

    npm install -g npm@$1
    nvm install $2
    nvm alias default $2
}

# code
cd $CALLER_PATH
checkForCommand 'npm' 'Npm not found. Please download and install Npm at https://docs.npmjs.com/downloading-and-installing-node-js-and-npm'
checkForCommand 'nvm' 'Nvm not found. Please download and install Nvm at www.nvm.sh'
installVersions $@

