pass=$(cat /opt/nexus/nexus-data/admin.password); sed -i 's/change_it/'$pass'/g' /opt/jenkins/credentials.sh
