pwd
cd modules/k8s
sed "s/tagversion/$1/g" frontend.tf > frontend1.tf
rm frontend.tf
cd ../../..