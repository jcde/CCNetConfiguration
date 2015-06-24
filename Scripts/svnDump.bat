if DEFINED %4 svnadmin dump %1 --incremental -r %2:head|%3 -P cegth > %4 ELSE svnadmin dump %1 --incremental -r %2:head > %3
