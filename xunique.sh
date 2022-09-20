#!/bin/sh

(which xunique)
hasxunique=$?
if [ "$hasxunique" -ne "0" ]; then
 echo "xunique is not found on path, execute: 'find ~/Library/Python -name 
'xunique'' or 'find /Library/Python -name 'xunique'' to find it and add it 
to the path based on README.md"

 if [ find /Library/Python -name 'xunique' | wc -l -eq "1" ]; then
  xuni=`find /Library/Python -name 'xunique'`
 else 
  if [ find ~/Library/Python -name 'xunique' | wc -l -eq "1" ]; then
   xuni=`find ~/Library/Python -name 'xunique'`
  fi
 fi
else 
 xuni=`which xunique`
fi

echo "using $xuni"

PROJECTS=`find . -name '*.xcodeproj'`
# return code to be used at the end
RESULT=0
for PROJECT in $PROJECTS
do
 echo "xUnique on $PROJECT"
 # run in a subshell in order to catch the return code
 ($xuni -s -p $PROJECT)
 result=$?
 git add $PROJECT

 # check if return code is OK if not then store it to return at the end
 if [ "$result" -ne "0" ]; then
  RESULT=$result
 fi
done
exit $RESULT