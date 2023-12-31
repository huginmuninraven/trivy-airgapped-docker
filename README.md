# Trivy Airgapped Docker File

This is a really simple way to build an offline Trivy container that contains the database.   
The Trivy documentation leaves creating the Dockerfile as an exercise for the reader.   
This Dockerfile bridges the gap. 

Instructions are taken from the following link: 

https://aquasecurity.github.io/trivy/v0.44/docs/advanced/air-gap/

## Prerequisites

- [Oras](https://oras.land/docs/installation/)


## Building Locally  

Run these commands locally to build your own Trivy image.  


``` bash
# Download git repo
git clone https://github.com/huginmuninraven/trivy-airgapped-docker.git

cd trivy-airgapped-docker

# Downloads databases locally
oras pull -o . ghcr.io/aquasecurity/trivy-db:2
mkdir trivydb 
tar xvf db.tar.gz -C trivydb

# Gets Trivy Java Database, unpacks locally
oras pull -o . ghcr.io/aquasecurity/trivy-java-db:1
mkdir javadb
tar xvf javadb.tar.gz -C javadb

#  Build and tag
docker build . --tag trivy-airgapped-docker:latest

# Test the new Docker image by scanning an old Python version
docker run trivy-airgapped-docker:latest image python:3.4-alpine
```
