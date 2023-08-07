output bucket_id {
  value       = aws_s3_bucket.my_fisrt_bucket.id
  #sensitive   = true
  description = "description"
}
# Posso executar o comando "terraform output" para mais detalhes desse output
