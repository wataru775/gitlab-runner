# QNAP gitlab-runner構築スクリプト

 これはQNAPのcontainer stationで端末実行内で実行する作業です
 * 検証済コンテナ : ubuntu:latest (20.04.1 LTS)


## スクリプトの準備パッケージの取得...
```
export DEBIAN_FRONTEND=noninteractive
export TZ=Asia/Tokyo
apt-get -y -qq update
apt-get -y -qq upgrade
apt-get install -y -qq git tzdata
```

## 最新の構築スクリプトを取得
```
git clone https://github.com/wataru775/gitlab-runner.git
```

Gitのアカウントを入力して取得します

## スクリプトを実行...
```
 /bin/bash ./gitlab-runner/for_QNAP/laravel_make.sh                                                                                         
```

これでできあがりです。


## Gitlab-runnerを登録します
最終工程として、Gitlabに登録します
GitlabのCI/CD 登録を参考にすると良いです。

https://docs.gitlab.com/runner/install/



```
gitlab-runner register
```

一例ですが、こんな感じです
```
# gitlab-runner register                                                                                                                                                                                                                                          
Runtime platform                                    arch=amd64 os=linux pid=19389 revision=ece86343 version=13.5.0                                                                                                                                                                   
Running in system-mode.                                                                                                                                                                                                                                                              
                                                                                                                                                                                                                                                                                     
Please enter the gitlab-ci coordinator URL (e.g. https://gitlab.com/):                                                                                                                                                                                                               
http://192.168.1.203:9080/                                                                                                                                                                                                                                                           
Please enter the gitlab-ci token for this runner:                                                                                                                                                                                                                                    
buYy_yKNBnvsX_eUQqU7                                                                                                                                                                                                                                                                 
Please enter the gitlab-ci description for this runner:                                                                                                                                                                                                                              
[c527cb5c7fef]: laravel                                                                                                                                                                                                                                                              
Please enter the gitlab-ci tags for this runner (comma separated):                                                                                                                                                                                                                   
                                                                                                                                                                                                                                                                                     
Registering runner... succeeded                     runner=buYy_yKN                                                                                                                                                                                                                  
Please enter the executor: docker, docker-ssh, parallels, shell, virtualbox, docker+machine, docker-ssh+machine, custom, ssh, kubernetes:                                                                                                                                            
shell                                                                                                                                                                                                                                                                                
Runner registered successfully. Feel free to start it, but if it's running already the config should be automatically reloaded!                                                                                                                                                      
```



