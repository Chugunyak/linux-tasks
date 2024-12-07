count=0

while true; do
echo "Введите целое число: "
read number
if (( number % 2 == 0 ))
then
break
fi
count=$((count+1))
done

echo "Количество считанных чисел: $count"
