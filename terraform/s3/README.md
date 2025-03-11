# Obsidian用S3バケット作成スクリプト

## 概要
このTerraformスクリプトは、Obsidianの`s3-image-uploader`プラグイン用のAWS S3バケットと、
そのバケットにアクセスするためのIAMユーザーを作成します。

## 作成されるリソース
- S3バケット (プライベートアクセス、バージョニング有効、暗号化有効)
- IAMユーザー (S3バケットへのアクセス権限付き)
- IAMポリシー (S3バケットへの読み書き権限)
- アクセスキーとシークレットキー

## 前提条件
- Terraformがインストールされていること (バージョン1.0.0以上)
- AWS CLIがインストールされ、設定済みであること
- AWSアカウントへの管理者権限

## 使用方法

### 1. 設定ファイルの準備
```bash
# サンプル設定ファイルをコピー
cp terraform.tfvars.example terraform.tfvars

# エディタで開いて必要な設定を変更
nano terraform.tfvars
```

### 2. Terraformの初期化
```bash
terraform init
```

### 3. 実行計画の確認
```bash
terraform plan
```

### 4. リソースの作成
```bash
terraform apply
```
確認メッセージが表示されたら、`yes`と入力して実行します。

### 5. 出力値の確認
実行が完了すると、以下の情報が出力されます：
- バケット名
- IAMユーザー名
- アクセスキー
- シークレットキー（実行時のみ表示）

これらの情報をメモしておいてください。特にアクセスキーとシークレットキーは、
Obsidianのs3-image-uploaderプラグインの設定に必要です。

## Obsidian s3-image-uploaderプラグインとの連携

1. Obsidianでs3-image-uploaderプラグインをインストール
2. プラグイン設定画面を開く
3. 以下の項目を設定:
   - S3 Bucket: 出力された`bucket_name`の値
   - AWS Region: 設定したリージョン（デフォルトは`ap-northeast-1`）
   - Access Key ID: 出力された`s3_access_key`の値
   - Secret Access Key: 出力された`s3_secret_key`の値

## 注意事項

### セキュリティ
- 生成されたシークレットキーは安全に保管してください
- バケットポリシーはデフォルトでプライベートに設定されています
- CORSは現在すべてのオリジンからのアクセスを許可しています。本番環境では制限することを推奨します

### コスト
- S3バケットの使用料とデータ転送料が発生します
- バージョニングを有効にしているため、古いバージョンのファイルも保存され、ストレージコストが増加する可能性があります

### リソースの削除
不要になった場合は、以下のコマンドでリソースを削除できます：
```bash
terraform destroy
```

## カスタマイズ
- `main.tf`: メインのリソース定義
- `variables.tf`: 変数の定義
- `outputs.tf`: 出力値の定義
- `provider.tf`: AWSプロバイダーの設定
- `terraform.tfvars`: 実際の設定値（gitignoreに追加することを推奨）