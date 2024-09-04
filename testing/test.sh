git status --porcelain=v1

echo $(git status --porcelain=v1) | grep "M"
