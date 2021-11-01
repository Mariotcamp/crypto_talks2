# 概要  
crypto_talksは仮想通貨について話し合える場をクイズ成績をもとにレベル分けをしながら提供するサービスです。
## 機能一覧  
・ユーザーログイン、ログアウト機能  
・クイズ受験機能  
・投稿に関するCRUD処理  
・投稿に対するコメント機能とその削除  
・投稿に対するいいね機能  
・いいねした投稿の一覧ページでのページネーション機能  
・フォロー、フォロー解除機能  
・フォロワーに基づいたランキング表示機能  
・low、middleクラスにクイズ再挑戦機能  
・Upperクラスには主要コインをキーワードとした投稿検索機能  
・ユーザー退会機能  
・管理者ログイン機能  
・管理者ユーザーban機能  
・管理者クイズ作成、削除機能  
## 使用技術  
アプリケーション内で使用した技術  
・Ruby2.6.3p62  
・Rails6.0.3  
インフラ  
・AWS（デフォルトVPC内にEC2サーバーを用意しそこにアプリケーションを配置しました）  
データベース  
・MySQL 5.7.22  
画像アップロード  
・Active Storageを使用しAWSのS3を導入  
