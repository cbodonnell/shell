# Utility functions related to networking

show-tcp-ports() {
	lsof -iTCP -sTCP:LISTEN -n -P | awk 'NR>1 {print $9, $1, $2}' | sed 's/.*://' | while read port process pid; do echo "Port $port: $(ps -p $pid -o command= | sed 's/^-//') (PID: $pid)"; done | sort -n
}

