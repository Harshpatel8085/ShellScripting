Harsh (){
    echo -e "my name is\e[34m Harsh\e[0m"
    echo "Load average on the system in last 1 minute: $(uptime | awk -F : '{print $NF}' | awk -F  , '{print $1}')"
    echo '$NF' is used to print last field of the row/value, It is called nfh field
}
Harsh