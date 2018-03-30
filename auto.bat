@echo off
echo pwd: %cd%

echo git add start
git add -A .
echo git add done
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo;
echo git commit start
set /p declation=input information:
git commit -m "%declation%"
echo git commit done
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo;
echo git push start
git push git@github.com:unforgettable-heart/notation
git push done
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo;
echo all done!
echo;

pause