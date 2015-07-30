# Git Add, Commit & Push file
FILE=$1
defcmt=DefaultComment
COMMENT=${2-$defcmt}
git pull --rebase
git add $FILE
git commit -m "$COMMENT"
git push
