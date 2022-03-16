source $HOME/.nvm/nvm.sh;

# variables
ARGUMENT_INFO_TEXT=$'Please enter the npm version and then the node version. \nExample: "install-npm-node.sh 6 12". \n(Note: entering latest for npm and "lts/*" for node is an option)\nExample: install-npm-node.sh latest "lts/*"'

# functions

# code
if [[ $# -ne 2 ]]
    then
        echo "$ARGUMENT_INFO_TEXT"
        exit 0
fi

if [[ $1 -eq 'latest' ]]
    then
        npm install -g npm
    else
        npm install -g npm@$1
fi
nvm install $2

