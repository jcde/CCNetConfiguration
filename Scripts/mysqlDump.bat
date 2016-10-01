rem mysqldump.exe %1 -h %3 --routines -u %4 -p%5 --default-character-set=utf8 --single-transaction --quick | 7z.exe a -p%6 -si -tzip "%2" 

mysqldump.exe %1 -h %4 -P %5 --routines -u %6 -p%7 --default-character-set=utf8 --single-transaction --quick | %2 -P %8 "%3" -