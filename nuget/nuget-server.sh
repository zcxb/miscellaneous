# install and run nuget server
docker run --detach=true \
--publish 8000:80 \
--env NUGET_API_KEY=<NUGET_API_KEY> \
--volume ~/nuget/database:/var/www/db \
--volume ~/nuget/packages:/var/www/packagefiles \
--name nuget-server \
--restart always \
sunside/simple-nuget-server

# push nuget package to the server
dotnet nuget push <PACKAGE_NAME>.<PACKAGE_VERSION>.nupkg -k <NUGET_API_KEY> -s http://remote.nugetserver.com:8000/

# delete nuget package from the server
dotnet nuget delete <PACKAGE_NAME> <PACKAGE_VERSION> -k <NUGET_API_KEY> -s http://remote.nugetserver.com:8000/

## nuget server above is not convenient enough

# use baget
docker run -d --restart always --name baget-server -p 8000:80 --env-file baget.env -v /home/dah
uasurvey/temp/nuget/baget:/var/baget loicsharma/baget:latest

 dotnet nuget push -s http://remote.nugetserver.com:8000/v3/index.json -k <NUGET_API_KEY> <PACKAGE_NAME>.<PACKAGE_VERSION>.nupkg