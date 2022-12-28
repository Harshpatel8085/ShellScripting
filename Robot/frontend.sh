ID=$(id -u)
if [ $ID -ne 0 ] ; then
    echo -e -n "\e[31m You need to run script as a Root user or with Sudo permission \e[0m"
    exit 1
fi

yum install nginx -yum
systemctl enable nginx
systemctl start nginx