echo "The following repositories will be reset and updated:"
for i in $(ls -d */); do
    echo "* ${i}"
done

echo ""
echo "Press ENTER to proceed:"
read -s -n 1 key

if [[ ! ${key} = "" ]]; then 
    echo "Abort!"
    exit
fi

for i in $(ls -d */); do
    echo ""
    echo "* ${i}"
    cd ${i}
    git fetch --all && git reset --hard origin/master
    cd ..
done

echo ""
echo "Done!"
