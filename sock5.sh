expect -c "
spawn bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh)

# 等待确认继续
expect \"是否继续?[y/n]:\" 
send \"y\r\"

# 设置账户名
expect \"请设置您的账户名:\" 
send \"lbxx\r\"

# 设置账户密码
expect \"请设置您的账户密码:\" 
send \"lbxx9527\r\"

# 设置访问端口
expect \"请设置面板访问端口:\" 
send \"9527\r\"

# 确认设定
expect \"确认设定,设定中\" 
expect \"set username and password success\"
expect \"set port 9527 success\"
expect eof
"
