#!/usr/bin/env bash
# The declare or typeset builtins, which are exact synonyms!
#   

# -r : readonly
# -i : integer, integer declaration eliminates the need for 'let'.
# -a : array
# -f : function Trick: A `declare -f` list of all the function previously defined
# -x : declares a variable as available for exporting outside the environment of the script itself

# ========== -r : readonly ======================
declare -r var1=1
echo "var1 = $var1"   # var1 = 1
# Uncomment below line will tell you: var1: readonly variable
#(( var1++ ))          # x.sh: line 4: var1: readonly variable

# ========== -i : integer =======================
declare -i number
# The script will treat subsequent occurrences of "number" as an integer.		

number=3
echo "Number = $number"     # Number = 3

number=three
# Tries to evaluate the string "three" as an integer.
echo "Number = $number"     # Number = 0
number=4
number+=1
echo "Number = $number"     # Integer declaration eliminates the need for 'let'.
echo 
# ========= -a : array ===========================
# ========= -x : export ===========================
declare -x var3
var3="this is now exported"



exit 0