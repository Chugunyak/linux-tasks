echo "Введите последовательно три числа: "
read num1
read num2
read num3

if [ $num1 -gt $num2 ] && [ $num1 -gt $num3 ]
then
echo "$num1 Наибольшее число."
elif [ $num1 -lt $num2 ] && [ $num3 -lt $num2 ]
then
echo "$num2 Наибольшее число."
else
echo "$num3 Наибольшее число."
fi
