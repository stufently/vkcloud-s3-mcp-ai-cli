# Статус

- Завершено: ресерч официальной документации и консервативный профиль; bilingual README, compat, Registry manifest, skill, Docker/release/CI.
- Завершено: Docker build/vet/race/lint (0 issues), versitygw conformance, MCP smoke (все 8 сочетаний уровней), мутационные ворота 87/87 (100%), их self-tests, check_docs, actionlint, GoReleaser snapshot и запуск непривилегированного образа.
- Доставка завершена: main опубликован, описание/topics настроены; [CI реализации `4095c3e`](https://github.com/stufently/vkcloud-s3-mcp-ai-cli/actions/runs/38064492739) зелёный.
- Нужна живая проверка: эндпоинты/регионы, условные заголовки, классы/цены, presign, API и ошибки на реальном тестовом бакете с ключом владельца.
- Релиз v0.1.0 и публикация OCI/Registry отложены до живой проверки.

- **[предположение]**: условные заголовки, bucket tagging, multi-AZ, точные байтовые границы/коды квот и региональные тарифы; консервативные ограничения описаны в [ресерче](docs/research/vkcloud-s3.md).
