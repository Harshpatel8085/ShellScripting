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
yum install nginx -y &>> /tmp/frontend.log
stat

echo -n "Enabling nginx :"
systemctl enable nginx &>> /tmp/frontend.log
stat

echo -n "starting nginx :"
systemctl start nginx &>> /tmp/frontend.log
stat

echo -e -n "\e[33m Downloading the code zip file of frontend \e[0m"
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip" &>> /tmp/frontend.log
stat

echo -e -n "\e[33m clearing the default content \e[0m"
cd /usr/share/nginx/html
rm -rf * &>> /tmp/frontend.log
stat
echo -e -n "\e[33m Ectracting the code zip file of frontend \e[0m"
unzip /tmp/frontend.zip &>> /tmp/frontend.log
stat

echo -e -n "\e[33m Copying the frontend \e[0m"
mv frontend-main/*  &>> /tmp/frontend.log
mv static/*  &>> /tmp/frontend.log
rm -rf frontend-main README.md &>> /tmp/frontend.log
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>> /tmp/frontend.log
stat
