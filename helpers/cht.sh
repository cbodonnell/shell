# cht.sh helper function
function cht() {
  if [ -z "$1" ]; then
    echo "Usage: cht <command>"
    return 1
  fi

  local command=$1
  shift
  curl -s "https://cht.sh/$command"
}

