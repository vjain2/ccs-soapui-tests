# Git Add, Commit & Push file
FILE=$1
COMMENT=$2
git pull
git add $FILE
git commit -m "$COMMENT"
git push
