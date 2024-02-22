openssl genrsa 2048 > ca-key.pem
if [ $? != 0 ]; then
	echo "echec de lancement du script  1"
	exit 666
fi
openssl req -new -x509 -nodes -days 365000 \
-key ca-key.pem \
-out ca-cert.pem
if [ $? != 0 ]; then
	echo "echec de lancement du script  2"
	exit 666
fi
openssl req -newkey rsa:2048 -nodes -days 365000 \
-keyout server-key.pem \
-out server-req.pem
if [ $? != 0 ]; then
	echo "echec de lancement du script 3"
	exit 666
fi
openssl x509 -req -days 365000 -set_serial 01 \
-in server-req.pem \
-out server-cert.pem \
-CA ca-cert.pem \
-CAkey ca-key.pem
if [ $? != 0 ]; then
	echo "echec de lancement du script 4"
	exit 666
fi
#openssl verify -CAfile ca-cert.pem \
#ca-cert.pem \
#server-cert.pem
#if [ $? != 0 ]; then
#	echo "echec de lancement du script 5"
#	exit 666
#fi
openvpn --genkey secret ta.key
if [ $? != 0 ]; then
	echo "echec de lancement du script 6"
	exit 666
fi
openssl dhparam -out dhparam.pem 2048
if [ $? != 0 ]; then
	echo "echec de lancement du script  7"
	exit 666
fi


scp ca-cert.pem user@192.168.0.10:/home/user/tp-r504/TP_VPN/testVPN