
cat <<EOF | while IFS=, read -r perms date time name target; do
101,1986-01-05,00:00,0,
402,1986-11-13,00:01,1,
604,1988-03-05,00:10,2,
777,1990-02-16,00:11,3,0
510,1990-10-07,01:00,4,
460,1990-11-07,01:01,5,
460,1991-02-08,01:10,6,
510,1991-03-08,01:11,7,
604,1994-05-20,10:00,8,
402,1994-06-10,10:01,9,
101,1995-04-10,10:10,A,
EOF
  # Set the full timestamp string for touch
  timestamp="$date $time"
    
  # Check if the target is empty (it's a file/dir) or not (it's a link)
  if [ -z "$target" ]; then
    # Check if permissions start with 'd' (directory) or '-' (file)
    if [[ "$perms" == 1* ]]; then
      # It's a directory (we use a trick: perms start with 1 for dr---)
      mkdir "$name"
      # The first digit of directory permissions is different, so we fix it
      chmod "4${perms:1}" "$name"
    else
      # It's a regular file
      touch "$name"
      chmod "$perms" "$name"
    fi
    # Set the timestamp for the newly created file or directory
    TZ=utc  touch -d "$timestamp" "$name"
  else
    # It's a symbolic link
    ln -s "$target" "$name"
    # Set the timestamp of the link itself (-h flag)
    touch -h -d "$timestamp" "$name"
  fi
done

