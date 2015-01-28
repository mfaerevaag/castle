# .dotfile
# mount-nas

function mount-nas -d "Mount NAS"
    sudo mount -t cifs //192.168.1.3/media -o user=markus,sec=ntlm /mnt/nas
end
