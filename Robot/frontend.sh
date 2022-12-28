ID=$(id -u)
if [ $ID -ne 0 ] ; then
    echo "You need to run script as a Root user or with Sudo permission"
    exit 1
fi

yum install nginx -yum
systemctl enable nginx
systemctl start nginx