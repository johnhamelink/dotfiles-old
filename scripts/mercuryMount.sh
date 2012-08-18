sudo mount -t smbfs //mercury.local/Music ~/Music -o username=guest,password=guest,uid=john,gid=audio
sudo mount -t smbfs //mercury.local/Movies ~/Videos/Movies -o username=guest,password=guest,uid=john,gid=john
sudo mount -t smbfs //mercury.local/TV ~/Videos/TV -o username=guest,password=guest,uid=john,gid=john
