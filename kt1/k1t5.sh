while true; do
echo "Меню:"
echo "1. Открыть nano"
echo "2. Открыть vi"
echo "3. Открыть links"
echo "4. Выход."

echo "Выберите пункт меню (1-4): "
read choice

if [ $choice == 1 ] || [ $choice == nano ]
then
nano
elif [ $choice == 2 ] || [$choice == vi ]
then
vi
elif [ $choice == 3 ] || [$choice == links]
then
links
elif [ $choice == 4 ] || ["$choice" == "Выход"]
then
break
fi
done
