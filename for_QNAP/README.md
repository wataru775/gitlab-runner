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
 /bin/bash ./gitlab-runner/for_QNAP/make.sh                                                                                         
```

これでできあがりです。

```
gitlab-runner register
```
とWebで登録しましょう



