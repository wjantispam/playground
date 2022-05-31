for a in {0..9} {a..h}
do
    for b in {0..9} {a..h}
    do
        h=${a}${b}
        echo -e $b randers to \\x$h
    done
done
