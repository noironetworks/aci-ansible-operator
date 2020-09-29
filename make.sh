kubectl delete -f deploy/operator.yaml

sudo ./operator-sdk build kentwu111/aci-ansible-operator:v1
sudo docker push kentwu111/aci-ansible-operator:v1

kubectl apply -f deploy/crds/aci.aw_contracts_crd.yaml
kubectl apply -f deploy/crds/aci.aw_epgs_crd.yaml

kubectl apply -f deploy/service_account.yaml
kubectl apply -f deploy/role.yaml
kubectl apply -f deploy/role_binding.yaml
kubectl apply -f deploy/operator.yaml

kubectl get pods -n aci-containers-system
kubectl logs -n=aci-containers-system aci-operator-7d55d4465f-g5r8r

