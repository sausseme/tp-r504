while IFS=";"  read v_nom v_passwd
do
	echo "nom=$v_nom"
	v_passwd=$ 
	adduser --disabled-password --gecos "" --ingroup t_users "$username"
	echo $v_nom:$v_passwd | chpasswd
	echo "nom=$v_nom passwd=$v_passwd"
done < list3.txt
