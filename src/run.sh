SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

sqlite3 a.db ".quit"
sqlite3 b.db ".quit"
sqlite3 a.db "vacuum;" "reindex;"

sqlite3 a.db "vacuum;"
sqlite3 a.db "attach 'b.db' as b" "vacuum b;"
sqlite3 a.db "vacuum into 'a2.db';"
sqlite3 a.db "attach 'b.db' as b" "vacuum b into 'b2.db';"

