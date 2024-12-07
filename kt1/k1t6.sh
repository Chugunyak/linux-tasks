if [[ "$HOME" == "$(pwd)" ]]; then
echo "Ты дома? Красаучег."
exit 0
else 
echo "Ты че не дома забыл? А ну в $HOME !"
exit 1
fi
