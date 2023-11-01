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
create_reddit_vm_with_startup_script.sh (ВМ создается но скрипт почему-то не запускается - переделал на yaml ниже)
deploy.sh
install_mongodb.sh
install_ruby.sh
startup.sh

Версия с yaml прикрепил файл yc-data.yaml
Команда для запуска:
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=yc-data.yaml
