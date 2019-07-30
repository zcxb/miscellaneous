#!/bin/bash
# author: chenjunyao

echo "This script will guide you to initialize a new docker container,"
echo "Please use"
echo ""
echo "    cd <YOUR_RELEASE_PATH>"
echo ""
echo "to make sure you run this script in the right place."

echo -n "Your app name: "
read name
echo -n "Inner port(80):"
read inner_port

if [ "$inner_port" == "" ]; then
    inner_port=80
fi

echo -n "Outer port:"
read outer_port
echo -n "Restart with system reboot?(Y/n)"
read b_restart

if [ "$b_restart" == "" ]; then
    b_restart=y
fi

cur_date="$(date +%m%d)"

echo "Step.1 docker build"
docker build -t $name:$cur_date .

echo "Step.2 remove old container"
docker ps --format "table {{.ID}}\t{{.Names}}" | grep $name | awk '{print $2}' | xargs docker rm -f

echo "Step.3 run new container"
if [ "$b_restart"x == "y"x -o "$b_restart"x == "Y"x ]; then
    docker run --name "$name"_"$cur_date" -p $outer_port:$inner_port -d $name:$cur_date --restart always
else
    docker run --name "$name"_"$cur_date" -p $outer_port:$inner_port -d $name:$cur_date
fi
echo "Done!"
exit 0
