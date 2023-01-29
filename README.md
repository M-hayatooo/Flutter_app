# p_counter app

パチンコのボーダーカウンターアプリ<br>
A Flutter Pachinko border counter app.

## アプリの概要

このアプリはパチンコで投資した際，1,000円ベース何回転するかをリアルタイムで表示するアプリ<br>
自分でメモしてスマホの電卓機能で計算するといった手間をなくすカウンターアプリ<br>
遊戯をしていると投資金額を忘れてしまいがちですが，カウンターボタンを押すことで投資金額を自動で記録してくれます<br>


## 付加していきたい機能

- 可算ボタンだけではなく減算ボタンを追加
- 打つ機種のボーダー回転数を記録させ，自分の打っている機種を選択することで回転数が足りているか，足りていないかを表示させる
- どれだけ回ったかを記録して，履歴として保存・再確認できるような機能を追加したい
- スマホ横持ち・縦持ちに対応できるようなウィジェットの表示機能の追加
- 回転数を再び入力する時にベース回転数が期待した値にならなかった時の処理を行えていないのでそこの実装



## 工夫した点

- アプリを利用してもらいたい業界を決め，需要がありそうなアプリを作成した点
- あまり沢山の機能を必要とせずシンプルで使いやすいアプリをモットーに作成した点
- Flutterでは任意の小数点での切り捨て，切り上げができるメソッドがなかった...？ので計算の工夫で小数点を指定するようにした点


##  動作環境

  sdk: '>=2.18.1 <3.0.0'
