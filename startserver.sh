. secrets/env.sh
sudo iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 3000
echo "" > tmp/pids/server.pid
rbenv global 2.3.4
bundle install
BUILD_ID='dont kill me' bundle exec rails s -d  -p 3000 -e production -b 0.0.0.0
