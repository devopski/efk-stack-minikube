minikube --vm-driver virtualbox --cpus 4 --memory 8192 start

kubectl create namespace efk-stack

helm install my-elasticsearch elastic/elasticsearch --version 7.11.1 --namespace efk-stack -f values_elastic.yaml

kubectl apply -f fluentd_deamonset.yaml -n kube-system

helm install my-kibana elastic/kibana --version 7.11.1 --namespace efk-stack 

kubectl port-forward deployment.apps/my-kibana-kibana -n efk-stack 5601:5601

kubectl apply -f logging_app.yaml