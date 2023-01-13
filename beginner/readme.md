# 環境構築
[Creating a Subgraph](https://thegraph.com/docs/en/developing/creating-a-subgraph/)にしたがって、環境構築を行います。
```sh
# コマンドラインツールをインストール
npm install -g @graphprotocol/graph-cli

# subgraphのプロジェクトを初期化する
graph init \
  --protocol ethereum \
  --product subgraph-studio \
  --from-contract 0xfe92DeBE6351B717A200A25366b59F7220B50161 \
  --network goerli \
  --abi ./contract/build/contracts/BeginnerCoin.json \
  begineercoin subgraph
```

