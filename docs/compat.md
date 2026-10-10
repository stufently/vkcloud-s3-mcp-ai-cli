# VK Cloud S3 compatibility

Generated from the embedded provider profile.

| Feature | Supported |
|---|---|
| acl | true |
| bucket_policy | true |
| bucket_tagging | false |
| conditional_delete | false |
| conditional_writes | false |
| cors | true |
| lifecycle | true |
| multipart | true |
| object_lock_config | true |
| object_retention | true |
| object_tagging | true |
| presign | true |
| versioning | true |

| Pool | Endpoint | Location | Multi-AZ | Classes |
|---|---|---|---|---|
| ru-msk | https://hb.ru-msk.vkcloud-storage.ru | Москва | false | STANDARD, STANDARD_IA |
| kz-ast | https://hb.kz-ast.vkcloud-storage.ru | Казахстан | false | STANDARD, STANDARD_IA |

| Class | Name | RUB/GB/month (from) | Verified | Checked |
|---|---|---|---|---|
| STANDARD | Hotbox | 2.28 | false | 2026-10-10 |
| STANDARD_IA | Icebox | 1.09 | false | 2026-10-10 |

Presign maximum: 604800 seconds; verified: false. Документированный потолок — 7 дней. Условные PUT/Copy/complete/Delete не подтверждены: запись по умолчанию и move отключены; нужна живая проверка.
