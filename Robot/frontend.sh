ID=$(id -u)
if [ $ID -ne 0 ] ; then
    echo -e -n "\e[31m You need to run script as a Root user or with Sudo permission \e[0m" #here -n will delete the line that usually echo leave below the message line
    exit 1
fi
stat(){
    if [ $? -eq 0 ] ; then
        echo -e  "\e[32m Success \e[0m"
    else
        echo -e  "\e[32m Failure \e[32m"
    fi
}

echo -n "Installing nginx :"
yum install nginx -y &>> tmp/frontend.log
stat

echo -n "Enabling nginx :"
systemctl enable nginx &>> /tmp/frontend.log
stat

echo -n "starting nginx :"
systemctl start nginx &>> /tmp/frontend.log
stat

