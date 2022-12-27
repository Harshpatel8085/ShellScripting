# if [expression 1]; then
#     command 1
#     exit 1 # this exit code is to know which condition is executing, using '$?' command in command line, this is not mandatory.
# elif [expression 2]; then
#     command 2
#     exit 2
# elif [expression 3]; then
#     command 3
#     exit 3
# else 
#     command-x
#     exit 4
# fi

c=$1

if [ "$c" -eq "10" ] ; then
    echo "value of c is 10"

elif [ "$c" -eq "20" ] ; then 
    echo "value of c is 20"

elif [ "$c" -eq "30" ] ; then
    echo "value of c is 30"

else
    echo "value is not 10,20 or 30"
fi