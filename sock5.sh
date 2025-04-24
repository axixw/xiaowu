#!/usr/bin/expect -f

spawn bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh)

# 等待 "是否继续?[y/n]:" 提示
expect {
    "是否继续?[y/n]:" {
        send "y\r"
    }
}

# 等待设置用户名的提示
expect "请设置您的账户名:" 
send "lbxx\r"

# 等待设置密码的提示
expect "请设置您的账户密码:" 
send "lbxx9527\r"

# 等待设置端口的提示
expect "请设置面板访问端口:" 
send "9527\r"

# 等待确认设定提示
expect "确认设定,设定中"

# 等待设定成功的提示
expect "set username and password success"
expect "set port 9527 success"

# 结束脚本
expect eof
