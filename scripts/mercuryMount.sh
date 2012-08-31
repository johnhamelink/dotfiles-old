sudo mount -t smbfs //mercury.local/Music ~/music -o username=guest,password=guest,uid=john,gid=audio
sudo mount -t smbfs //mercury.local/Movies ~/videos/Movies -o username=guest,password=guest,uid=john,gid=john
sudo mount -t smbfs //mercury.local/TV ~/videos/TV -o username=guest,password=guest,uid=john,gid=john
sudo mount -t smbfs //mercury.local/Download ~/downloads -o username=guest,password=guest,uid=john,gid=john
