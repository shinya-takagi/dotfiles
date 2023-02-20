# Do not put file names in completion
complete usbmnt --no-files

complete --command usbmnt --exclusive --condition __fish_use_subcommand --arguments "-m" --description "Mount file system"
complete --command usbmnt --exclusive --condition __fish_use_subcommand --arguments "-u" --description "Unmount drive"

