child_process.spawn 在执行shell命令时，只能执行一条命令，而不能执行多条命令，像
```
echo xxx > a.txt 
```
这样的语句只有创建时能够生效，但是追加时是不生效的。