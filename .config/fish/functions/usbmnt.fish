function usbmnt
  set _opt $argv[1]
  set _sym $argv[2]

  echo $_opt $_sym

  switch $_opt
    case -m
      sudo mount -t drvfs $_sym: -o metadata,uid=1000,gid=1000 /mnt/usb
    case -u
      sudo umount /mnt/usb
    case '*'
      echo "options must set -u or -m"
      echo "usbmnt [option] DRIVE_SYSTEM"
      echo ""
      echo "ex. Drive F in USB"
      echo "usbmnt -m F"
  end

end
