#!/usr/bin/env bash 

# set variables
company="zcxb"
project="app1"
port="8080"
directory="/data/app1/app"

# try get args from command
# -c company
# -d base directory of docker mount destination
# -n project name
# -p the port exports on
while getopts "c:d:n:p:" arg;
do
    case "${arg}" in
        c)
            company=${OPTARG};;
        d)
            directory=${OPTARG};;
        n)
            project=${OPTARG};;
        p)
            port=${OPTARG};;
        \?);;
    esac
done

# cd to solution root dir
cd $(dirname $0)
cd ..

# count existed images on today
count=$(docker images -a | grep $company/$project | grep "$(date +%m%d)" -c)

# generate name and tag for new image
tag=$(date +%m%dv$(expr $count + 1))
image="$company/$project:$tag"
echo "image name: $image"

# build from the Dockerfile
echo "now building the image ..."
docker build -t $image -f Dockerfile .

# remove container running on the specific port
echo "removing container running on the specific port ..."
docker ps | grep $port | awk '{print $1}' | xargs docker stop

# run new container
echo "now running a new container ..."
# make sure you have created application.config as a file first
docker run \
    -dp $port:80 \
    --name "$company-$project-$tag" \
    --restart always \
    -v $directory/log:/app/log \
    -v $directory/images:/app/images \
    -v $directory/conf.d:/app/conf.d \
    $image

echo "completed."