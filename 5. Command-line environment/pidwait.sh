pidwait()
{
	wait "$1"
}

sleep_amount=10
sleep ${sleep_amount} &
pid=$(pgrep -f "sleep ${sleep_amount}")
pidwait "${pid}"
