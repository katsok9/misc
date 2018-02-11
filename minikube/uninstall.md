1. remove current instance of minikube
'minikube delete'

2. remove profile conf folders for kubectl and minikube
'rm -rf .minikube/'
'rm -rf .kube/'

3. remove docker containers and images
'docker rm $(docker ps -a -q)'
'docker rmi $(docker images -q)'

