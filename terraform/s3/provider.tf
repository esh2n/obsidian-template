# AWSプロバイダーの設定

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # 互換性のあるバージョンを指定（最新の5.x系に更新）
    }
  }
  
  required_version = ">= 1.0.0" # 必要なTerraformのバージョン
}

provider "aws" {
  region = var.aws_region

  # AWS認証情報を直接指定
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  
  # または AWS CLIプロファイルを使用する場合
  # profile = "default"
}