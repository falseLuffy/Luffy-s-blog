function mergeBranch () {
    git checkout feature/provincial-procuratorate
    git pull
    git merge --no-edit "$1"
    git push
    echo "合并$1分支到provincial-procuratorate"

    for branch in demo developing
    do
        git checkout "$branch"
        git pull 
        git merge --no-edit remotes/origin/feature/provincial-procuratorate 
        git push
        echo "合并provincial-procuratorate分支到$branch"
    done
    git checkout "$1"  
}

cd /Users/wy/Documents/future-data/fd-vue-wpd
branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
echo "当前分支是$branch"
if test $branch = 'bugfix/ruixu0110' ;then 
    mergeBranch $branch
else 
    echo '分支错了吧'
fi

cd -