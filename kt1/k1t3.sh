lines=()
while true; do
echo "Введите строку, q закончит ввод."
read stringystring
if [[ "$stringystring" == "q" ]] 
then
break
fi
lines+=("$stringystring")
done

echo "${lines[@]}"
