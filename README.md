# zippaa_infra
zippaa Infra repository

bastion_IP: 51.250.80.225
local_vm_IP: 10.128.0.14


DZ3 :
# Варианте подключения к internalVM со своего ноутбука через bastion [я -> bastion -> internalVM] в одну строку:
ssh -tt -i ~/.ssh/id_rsa -A izinovev@51.250.80.225 ssh -tt izinovev@10.128.0.14

# Второй вариант сокращенный
Host bastion
  Hostname 51.250.80.225
  User izinovev

Host local-vm
  Hostname 10.128.0.14
  User izinovev
  ProxyCommand ssh -W %h:%p -i ~/.ssh/id_rsa -A izinovev@51.250.80.225


Certificate for web: Let'sEncrypt
https://51.250.80.225.nip.io/
