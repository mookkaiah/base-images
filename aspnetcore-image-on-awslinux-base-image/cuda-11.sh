#!/bin/bash
set -ex
# Redirect all output to a log file and to /dev/console for viewing in AWS E02
System Logs
SCRIPT NAME='basename "$0"
exec > >(tee /var/log/SSCRIPT NAME.log 1 logger -t $SCRIPT NAME -s 2>/dev/console) 2
>&1
source /opt/pipeline/vars.sh
cd /opt/pipeline/scripts/cuda-11

echo "=== Starting Docker cude build

# Login to ECR
echo "Logging in to ECR"
eval $(aws ecr get-login --no-include-email | sed 's|https://||')

echo "Correct cuda Docker file"

sed	-e "s1{{ context.Ecr.RegistryUri }}1${RegistryUri}lg" Dockerfile
sed	-e "sit{ context.ProxyUrl 111$01TTP_PROXYllg" Dockerfile
sed	-e "s1{{ context.NoProxy }11${NO_PROXY}lg" Dockerfile

# Build the Docker image
echo "Building image 'amazonlinux-aspnetcore-runtime-2117-cuda-11'"
docker build -t amazonlinux-aspnetcore-runtime-2117-cuda-11 .

# Review list of images
docker images

# Tag image with the ECR repository
# echo "Tagging image"
docker tag amazonlinux-aspnetcore-runtime-2117-cuda-11 $fRegistryUril/shared/amazonlinux-aspnetcore-runtime-2117-cuda-11:latest
# docker tag 
${RegistryUri}/shared/amazonlinux-aspnetcore-runtime-2117-cuda-11:latest 
${RegistryUri}/shared/amazonlinux-aspnetcore-runtime-2117-cuda-11:latest

# # Push the image
# echo "Pushing image to ECR"
# docker push
${RegistryUri}/shared/amazonlinux-aspnetcore-runtime-2117-cuda-11:210704
docker push $fRegistryUril/shared/amazonlinux-aspnetcore-runtime-2117-cuda-11:latest

echo "=== Success - Docker cuda complete =--"