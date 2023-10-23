groupdel t_users

while IFS= read -r username; do
	if id "$username" &>/dev/null; then        
		deluser "$username"
	fi
done < list1.txt
