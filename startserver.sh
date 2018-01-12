. secrets/env.sh
#sudo iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 3000
echo "" > tmp/pids/server.pid
bundle exec rails s -p 3000 -e production -b 0.0.0.0
