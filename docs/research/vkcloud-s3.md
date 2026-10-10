# VK Cloud S3 — официальный ресерч

Проверено 2026-10-10. Использованы только [официальные исходники документации VK Cloud](https://github.com/vk-cs/docs-public) и сайт провайдера. Живой аккаунт не использовался; весь профиль `verified:false`. **[предположение]** обозначает непроверенные сведения и консервативные решения.

## Эндпоинты и адресация

Москва: `https://hb.ru-msk.vkcloud-storage.ru` (алиас `https://hb.vkcloud-storage.ru`), SigV4 `ru-msk`; Казахстан: `https://hb.kz-ast.vkcloud-storage.ru`, SigV4 `kz-ast`. [Загрузка и регионы](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/instructions/objects/upload-object/upload-object.md) [S3 авторизация](https://github.com/vk-cs/docs-public/blob/master/docs/ru/tools-for-using-services/api/api-spec/s3-rest-api/intro/intro.md)

Path-style показан в подписанной ссылке `endpoint/bucket/key`; virtual-host используется в примерах HTTP `bucket.hb.ru-msk.vkcloud-storage.ru`. Для бакетов с точками HTTPS virtual-host имеет ограничение сертификата. Профиль выбирает path-style. [Подписанные URL](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/concepts/access/signed-url/signed-url.md) [Введение/классы](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/concepts/about/about.md) [S3 авторизация](https://github.com/vk-cs/docs-public/blob/master/docs/ru/tools-for-using-services/api/api-spec/s3-rest-api/intro/intro.md)

**[предположение]** `multi_az:false` означает отсутствие подтверждённого обещания нескольких зон в проверенных страницах, а не доказанное отсутствие резервирования. Оба класса назначены обоим регионам по общей документации; тариф/доступность Казахстана нужно уточнить у аккаунта. [Введение/классы](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/concepts/about/about.md)

## Классы и цены

Hotbox = `STANDARD`, Icebox = `STANDARD_IA`; BackupBucket предназначен для управляемых резервных копий ВМ и не добавлен как пользовательский класс. [Введение/классы](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/concepts/about/about.md)

Официальный прайс показывает хранение Hotbox 2,28 ₽/ГБ за 30 дней (0,000053 ₽/мин), Icebox 1,09 ₽/ГБ за 30 дней (0,000025 ₽/мин), с НДС. Исходящий трафик соответственно 1,31/1,67 ₽/ГБ. API и входящий трафик не тарифицируются. [Прайс](https://cloud.vk.ru/pricelist), [Тарификация](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/tariffication/tariffication.md)

**[предположение]** Поле месячной цены использует опубликованную оценку за 30 дней; региональная цена, единицы биллинга, скидки и итоговый счёт требуют живой проверки. `verified:false` запрещает считать эти значения подтверждённым тарифом аккаунта. [Прайс](https://cloud.vk.ru/pricelist).

## Условные запросы и API

| Возможность | Решение профиля и доказательство | Источник |
|---|---|---|
| If-None-Match / If-Match PUT, Copy, complete, Delete | **[предположение]** поддержка защитных условий не установлена: параметры в проверенных методах их не перечисляют. `conditional_writes:false`, `conditional_delete:false` | [Методы объектов](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/_includes/_s3_api_object.md), [Multipart](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/_includes/_s3_api_multipart.md) |
| Теги объектов | Put/Get/DeleteObjectTagging; превышение числа тегов — `400 BadRequest` | [Object tagging](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/_includes/_s3_api_tagging.md) |
| Теги бакета | **[предположение]** методы не найдены в перечне; `bucket_tagging:false` | [Возможности/API](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/concepts/features/features.md) |
| Lifecycle | Настройка/чтение/удаление правил, максимум 50 | [Возможности/API](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/concepts/features/features.md), [Лимиты](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/_includes/_s3_limits.md) |
| ACL | Get/Put для бакета и объекта | [Возможности/API](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/concepts/features/features.md) |
| Versioning | Enabled/Suspended, версии и delete markers | [Versioning](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/concepts/versioning/versioning.md) |
| Object Lock | Get/PutObjectLockConfiguration; retention/ legal hold, governance/compliance | [Object Lock API](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/_includes/_s3_api_object_lock.md), [Object Lock](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/concepts/objects-lock/objects-lock.md) |
| CORS | Get/Put/DeleteBucketCORS | [Возможности/API](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/concepts/features/features.md) |
| Bucket policy | Get/Put/DeleteBucketPolicy описаны отдельно; они отсутствуют в сводной таблице, но присутствуют в документации политики | [Bucket policy](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/concepts/access/bucket-policy/bucket-policy.md) |
| Multipart | Create/UploadPart/ListParts/ListUploads/Complete/Abort | [Multipart](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/_includes/_s3_api_multipart.md) |

Сводная таблица опускает некоторые методы, описанные в отдельных API-страницах (GetObjectLockConfiguration, versioning, policy); профиль опирается на конкретные методы. Старые примеры `hb.bizmrg.com` не используются как актуальные endpoint. [Object Lock API](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/_includes/_s3_api_object_lock.md) [Versioning](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/concepts/versioning/versioning.md) [Bucket policy](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/concepts/access/bucket-policy/bucket-policy.md) [Загрузка и регионы](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/instructions/objects/upload-object/upload-object.md)

Без подтверждённой атомарности запись без перезаписи отказывает **до сетевых запросов**. Согласованная запись требует `overwrite:true` и подтверждения по общей политике; move не регистрируется. Lifecycle, ACL, bucket tags и retention не имеют инструментов настройки в текущем kit.

## Presign, лимиты и ошибки

Presign до `604800` секунд (7 дней), авторизация AWS4-HMAC-SHA256; URL может использовать конкретный HTTP-метод. [Подписанные URL](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/concepts/access/signed-url/signed-url.md)

Обычный объект/часть до 32 ГБ, multipart до 320 ТБ, 1–10000 частей; части кроме последней минимум 5 МБ. До 100 бакетов, 50 аккаунтов, 50 lifecycle-правил; объём бакета и число объектов не ограничены. [Лимиты](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/_includes/_s3_limits.md) [Возможности/API](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/concepts/features/features.md) [Multipart](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/_includes/_s3_api_multipart.md)

На бакет: обычные запросы 1000/с, листинг 250/с; превышение возвращает HTTP **503**. **[предположение]** XML-код при этом и точные ошибки при превышении объёма/бакетов не установлены по документации, их нельзя подменять AWS-кодами. [FAQ/rate limits](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/faq/faq.md)

Нереализованные методы возвращают XML `NotImplemented`; ошибка тегов — `400 BadRequest`; Copy при некорректном сочетании tagging заголовков — `501 Not Implemented`. [Возможности/API](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/concepts/features/features.md) [Object tagging](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/_includes/_s3_api_tagging.md) [Методы объектов](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/_includes/_s3_api_object.md)

**[предположение]** `max_put_bytes:32000000000` — консервативное десятичное представление 32 ГБ; точную байтовую границу проверить живым тестом. [Возможности/API](https://github.com/vk-cs/docs-public/blob/master/docs/ru/storage/s3/concepts/features/features.md)

## Нужна живая проверка

Оба региона, классы и региональные цены; условные PUT/Copy/complete/Delete; presign и граница срока; bucket API, versioning/lock, реальные XML-коды и квоты. Versitygw проверяет реализацию и регистрацию по профилю, но не облако VK.
