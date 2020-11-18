function findFile1 {
    echo "$#"
    if [ "$#" -eq 2 ]
    then
        file=$1
        path=$2

        find $path -type d -name "$file" -print | head -n 1
    else
        echo "Error"
    fi
}

findFile1 'flutter' "$HOME"