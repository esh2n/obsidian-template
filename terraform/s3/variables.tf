# 変数定義

variable "bucket_name" {
  description = "Obsidianの画像保存用S3バケットの名前"
  type        = string
  default     = "obsidian-images-bucket" # デフォルトのバケット名（実際の環境に合わせて変更必要）
}

variable "environment" {
  description = "環境名（dev, staging, prod等）"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWSリージョン"
  type        = string
  default     = "ap-northeast-1" # 東京リージョン
}

variable "aws_access_key" {
  description = "AWS アクセスキー"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS シークレットキー"
  type        = string
  sensitive   = true
}