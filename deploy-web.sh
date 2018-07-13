# Use minikube's remote Docker daemon
eval $(minikube docker-env)
# Build image directly to Docker daemon
gradle jibDockerBuild
# Delete any previous web deployment
kubectl delete --ignore-not-found -f ./deploy-web.yml
# Delete any previous service deployment
kubectl delete --ignore-not-found -f ./web-service.yml
# Create web deployment
kubectl create -f ./deploy-web.yml --record
# Create web service
kubectl create -f ./web-service.yml --record