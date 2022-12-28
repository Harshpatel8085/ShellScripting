ID=$(id -u)
if [ $ID -ne 0 ] ; then
    echo -e -n "\e[31m You need to run script as a Root user or with Sudo permission \e[0m" #here -n will delete the line that usually echo leave below the message line
    exit 1
fi

stat(){
    if [ $1 -eq 0 ] ; then
        echo -e  "\e[32m Success \e[0m"
    else
        echo -e  "\e[32m Failure \e[32m"
    fi
}

echo "Installing nginx"
yum install nginx -y
stat ?

echo "Enabling nginx"
systemctl enable nginx
stat ?

echo -n "starting nginx"
systemctl start nginx
stat ?
