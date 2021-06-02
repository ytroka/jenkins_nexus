# jenkins_nexus

Задание: Создать CI/CD используя Ansible, Jenkins, Docker и Nexus.

Написать ansible playbook, при вызове которого будет подниматься docker контейнер с Jenkins, автоматически пулится любой проект из github.com (хоть «Hello world!»), собираться в артефакт и выкладываться в docker контейнер Nexus. Контейнеры можно обернуть в docker-compose.

Пользователь, после запуска playbook должен увидеть на своей машине по адресам:

 • https://jenkins.example.com – саму сборку. Вход на Jenkins без авторизации.

 • https://nexus.example.com – артефакт сборки из Jenkins. Вход в Nexus без авторизации.

================================================================================

1. В роли docker-install выполняется установка Docker, актуально только для CentOS 7, так как это была моя целевая машина. Эта роль не обязательна.
2. В роли nexus-install запускается Nexus, посредством использования docker-compose файла.
3. В роли jenkins-install запускаеся Jenkins. В плейбук установки добавлены файлы которые отключают авторизацию, CSRF Protection (мешала добавлению Job'a) и добавляют jenkins-cli в home директорию Jenkins. 
4. В роли nginx-over-https генерируется самоподписанный сертификат для домена ".example.com", сертификат подкладывается в директорию nginx'a, так же копируется готовый conf файл. Плюс к этому добавляется запись в /etc/hosts, чтобы запросы через https://jenkins.example.com передавались на Jenkins. 
5. Запуск установки осуществляется через install.yml
6. В файле hosts необходимо добавить адрес целевого сервера с именем myserver в блоке remote и адрес localhost. Пример:

```
localhost ansible_connection=local

[remote]

myserver ansible_host=192.168.10.90 ansible_user=root
```
Имена добавил специально, чтобы можно было добавить адрес удалённого сервера в /etc/hosts машины с ansible (т.е. самого пользователя).
