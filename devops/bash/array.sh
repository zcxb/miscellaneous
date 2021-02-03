# do with array.
array=($(find . -name "*.txt"))
for i in "${array[@]}"; do echo $i; done