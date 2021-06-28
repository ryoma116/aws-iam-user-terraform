output "secret_access" {
  value       = aws_iam_access_key.user_access_key.encrypted_secret
  description = "IAMユーザの暗号化されたシークレットキー"
}
