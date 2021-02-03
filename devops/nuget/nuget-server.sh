# use baget
docker run -d \
  --restart always \
  --name baget-server \
  -p 8000:80 \
  --env-file baget.env \
  -v $PWD/baget:/var/baget \
  loicsharma/baget:latest

dotnet nuget push -s http://remote.nugetserver.com:8000/v3/index.json -k $ApiKey <PACKAGE_NAME>.<PACKAGE_VERSION>.nupkg
dotnet nuget delete <PACKAGE_NAME> <PACKAGE_VERSION> -k $ApiKey -s http://remote.nugetserver.com:8000/