#! /bin/bash

sed "s/tagVersion/$1/g" deployment-nodeapp.yaml > deployment-config.k8s.yaml