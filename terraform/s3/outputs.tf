# 出力定義

output "bucket_name" {
  description = "作成されたS3バケットの名前"
  value       = aws_s3_bucket.obsidian_images.bucket
}

output "bucket_arn" {
  description = "S3バケットのARN"
  value       = aws_s3_bucket.obsidian_images.arn
}

output "s3_user_name" {
  description = "S3アクセス用のIAMユーザー名"
  value       = aws_iam_user.obsidian_s3_user.name
}

output "s3_user_arn" {
  description = "IAMユーザーのARN"
  value       = aws_iam_user.obsidian_s3_user.arn
}

output "s3_access_key" {
  description = "S3アクセス用のアクセスキー"
  value       = aws_iam_access_key.obsidian_s3_key.id
  sensitive   = false # 実際の本番環境では true に設定すべき
}

output "s3_secret_key" {
  description = "S3アクセス用のシークレットキー"
  value       = aws_iam_access_key.obsidian_s3_key.secret
  sensitive   = true # シークレットキーは常に隠すべき
}

output "s3_bucket_domain_name" {
  description = "S3バケットのドメイン名"
  value       = aws_s3_bucket.obsidian_images.bucket_domain_name
}