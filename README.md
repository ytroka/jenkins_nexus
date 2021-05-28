# jenkins_nexus

Задание: Создать CI/CD используя Ansible, Jenkins, Docker и Nexus.

Написать ansible playbook, при вызове которого будет подниматься docker контейнер с Jenkins, автоматически пулится любой проект из github.com (хоть «Hello world!»), собираться в артефакт и выкладываться в docker контейнер Nexus. Контейнеры можно обернуть в docker-compose.

Пользователь, после запуска playbook должен увидеть на своей машине по адресам:

 • https://jenkins.example.com – саму сборку. Вход на Jenkins без авторизации;

 • https://nexus.example.com – артефакт сборки из Jenkins. Вход в Nexus без авторизации.
