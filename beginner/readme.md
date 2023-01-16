# 入門編
The Subgraphを作った人を使ったことない人向けの入門用資料です。

# 環境構築
[Creating a Subgraph](https://thegraph.com/docs/en/developing/creating-a-subgraph/)にしたがって、環境構築を行います。
といっても、コマンドラインツールをインストールするだけです。
```sh
# コマンドラインツールをインストール
npm install -g @graphprotocol/graph-cli
```

# サンプルプロジェクトの作成から実行まで
サンプルとして[BeginnerCoin](./contract/contracts/BeginnerCoin.sol)コントラクトのSubgraphを作成します。

### 1. コントラクトのDelopy
BeginnerCoinコントラクトをGanache上にデプロイします。
```sh
# 作業ディレクトリへ移動
cd contract

# ganacheの起動
npm run chain

# コントラクトのDeploy
npm run migrate
```

### 2. GraphNodeを立ち上げる
今回は、local環境で立ち上げたGraphNodeにSubgraphをデプロイします。
```sh
# 作業ディレクトリに移動
cd docker

# dockerの立ち上げ
docker compose up
```

### 3. プロジェクトの初期化
コマンドラインツールを使って、BeginnerCoinコントラクトのプロジェクトを初期化します
```sh
# 作業ディレクトリに移動
cd sandbox

# BeginnerCoinのSubgraphを初期化
graph init \
  --protocol ethereum \
  --product subgraph-studio \
  --from-contract 0x181492cC5d738c51B236603cE649229A17a7cb0e \
  --network mainnet \
  --abi ../contract/build/contracts/BeginnerCoin.json \
  begineercoin subgraph
```

### 4. Subgraphのデプロイ
```sh
# 作業ディレクトリに移動
cd sandbox/subgraph

# subgraphを登録
npm run create-local

# subgraphのでデプロイ
npm run deploy-local
```

### 5. Subgraphの動作確認
Remix等を通じてコントラクトのapproveイベントを発生させる
そして、ブラウザでThe Graphの[Query実行UI画面](http://localhost:8000/subgraphs/name/begineercoin/graphql)にアクセスして、Queryを実行する
```javascript
{
  exampleEntities(where:{
    owner: "0xE3b0DE0E4CA5D3CB29A9341534226C4D31C9838f"
  }) {
    id
    spender
    count
    amount
  }
}
```
