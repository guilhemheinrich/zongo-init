#! /bin/bash

sudo apt-get install ssmtp ufw -y
DIR="`dirname \"$0\"`"
cp $DIR/../init-files/ssmtp.conf /etc/ssmtp/ssmtp.conf

printf "root:zezongo@gmail.com:smtp.gmail.com:587\n$(whoami):zezongo@gmail.com:smtp.gmail.com:587\n" > /etc/ssmtp/revaliases

ufw allow out 25/tcp
sudo ufw allow out 465/tcp
sudo ufw allow out  587/tcp

printf "function mtm {   
case \"\$#\" in
    1 )
    mail -s \$1 zezongo@gmail.com ;;
    2 )
    echo \$2  |  mail -s \$1 zezongo@gmail.com ;;
    * )
    printf \"Send a message to me(zezongo@gmail.com). Usage :\n <subject> [text]\n\" ;;
esac
}\n" >> $HOME/.bash_aliases

# function mtm {   
# case "$#" in
#     1 )
#     mail -s $1 zezongo@gmail.com ;;
#     2 )
#     echo $2  |  mail -s $1 zezongo@gmail.com ;;
#     * )
#     printf "Send a message to me(zezongo@gmail.com). Usage :\n <subject> [text]\n" ;;
# esac
# }
