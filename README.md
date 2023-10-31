# zippaa_infra
zippaa Infra repository

bastion_IP = 158.160.35.55

someinternalhost_IP = 10.128.0.14


DZ3 :
# Варианте подключения к internalVM со своего ноутбука через bastion [я -> bastion -> internalVM] в одну строку:
ssh -tt -i ~/.ssh/id_rsa -A izinovev@158.160.35.55 ssh -tt izinovev@10.128.0.14

# Второй вариант сокращенный: создать файл .ssh/config и внести туда такую информацию:
Host bastion
  Hostname 158.160.35.55
  User izinovev

Host local-vm
  Hostname 10.128.0.14
  User izinovev
  ProxyCommand ssh -W %h:%p -i ~/.ssh/id_rsa -A izinovev@158.160.35.55


Certificate for web: Let'sEncrypt
https://158.160.35.55.nip.io

DZ4 :

Перенесены в отдельную папку VPN задания с прошлого занятия

testapp_IP = 158.160.37.229
testapp_port = 9292

Добавлены скрипты по установке ПО и развертыванию ВМ в облаке YC:
create_reddit_vm.sh
create_reddit_vm_with_startup_script.sh
deploy.sh
install_mongodb.sh
install_ruby.sh
startup.sh
