pwd
sed "s/tagversion/$1/g" frontend.yaml > frontend1.yaml
rm frontend.tf
cd ../../..