
f () {
    if [ $# -lt 1 ]; then
        echo "Usage: $0 <search_string> [num lines before] [num lines after]"
        echo "Example: $0 neckbeard"
        echo "Example: $0 neckbeard 3 3"
    else

        AFTER=""
        BEFORE=""
        if [ ! -z $2 ]; then
            AFTER="-A $2"
        fi
        if [ ! -z $3 ]; then
            BEFORE="-B $3"
        fi

        grep -Rn $AFTER $BEFORE $1 .
    fi
}
