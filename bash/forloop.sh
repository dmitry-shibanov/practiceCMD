echo Start work
arguments=($(./testLoop.sh))
echo ${arguments[@]}
for item in ${arguments[@]}
do 
    echo $item
done