grep -i "error" * > errors.log
grep -Eo '[^ ]+.[^ ]+' errors.log
