allThreads=(1 2 4 8 16 32 64 128)
allRuntimes=()
for t in ${allThreads[@]}; do
  runtime=$(./pipeline --threads $t)
  allRuntimes+=( $runtime )
done
echo ${allRuntimes[@]}
