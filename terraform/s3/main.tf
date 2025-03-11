# S3バケット用のTerraformコンフィグレーション

# S3バケットの作成
resource "aws_s3_bucket" "obsidian_images" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
    Project     = "Obsidian"
    Description = "ObsidianのS3画像アップロードプラグイン用バケット"
  }
}

# バケットのACL設定
resource "aws_s3_bucket_ownership_controls" "obsidian_images" {
  bucket = aws_s3_bucket.obsidian_images.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "obsidian_images" {
  depends_on = [aws_s3_bucket_ownership_controls.obsidian_images]
  bucket     = aws_s3_bucket.obsidian_images.id
  acl        = "private"
}

# バケットのパブリックアクセスブロック設定
resource "aws_s3_bucket_public_access_block" "obsidian_images" {
  bucket = aws_s3_bucket.obsidian_images.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# バージョニングの有効化
resource "aws_s3_bucket_versioning" "obsidian_images" {
  bucket = aws_s3_bucket.obsidian_images.id
  versioning_configuration {
    status = "Enabled"
  }
}

# サーバーサイド暗号化の有効化
resource "aws_s3_bucket_server_side_encryption_configuration" "obsidian_images" {
  bucket = aws_s3_bucket.obsidian_images.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# CORSの設定（Obsidianアプリからのアクセスを許可）
resource "aws_s3_bucket_cors_configuration" "obsidian_images" {
  bucket = aws_s3_bucket.obsidian_images.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "POST", "DELETE"]
    allowed_origins = ["*"] # 本番環境では適切なオリジンに制限することを推奨
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}

# IAMユーザーの作成（S3アクセス用）
resource "aws_iam_user" "obsidian_s3_user" {
  name = "obsidian-s3-user"
  path = "/system/"

  tags = {
    Description = "Obsidianアプリケーション用のS3アクセスユーザー"
  }
}

# IAMポリシーの作成
resource "aws_iam_policy" "obsidian_s3_policy" {
  name        = "obsidian-s3-policy"
  description = "ObsidianのS3アクセス権限を定義するポリシー"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ]
        Effect   = "Allow"
        Resource = [
          "${aws_s3_bucket.obsidian_images.arn}",
          "${aws_s3_bucket.obsidian_images.arn}/*"
        ]
      }
    ]
  })
}

# IAMユーザーにポリシーをアタッチ
resource "aws_iam_user_policy_attachment" "obsidian_s3_attach" {
  user       = aws_iam_user.obsidian_s3_user.name
  policy_arn = aws_iam_policy.obsidian_s3_policy.arn
}

# アクセスキーの作成
resource "aws_iam_access_key" "obsidian_s3_key" {
  user = aws_iam_user.obsidian_s3_user.name
}