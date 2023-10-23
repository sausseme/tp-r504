groupadd t_users

while IFS= read -r username; do
        adduser --disabled-password --gecos "" --ingroup t_users "$username"
done < list1.txt
