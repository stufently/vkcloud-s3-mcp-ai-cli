# Статус

- Завершено: ресерч официальной документации и консервативный профиль; bilingual README, compat, Registry manifest, skill, Docker/release/CI.
- Завершено: Docker build/vet/race/lint (0 issues), versitygw conformance, MCP smoke (все 8 сочетаний уровней), мутационные ворота 87/87 (100%), их self-tests, check_docs, actionlint, GoReleaser snapshot и запуск непривилегированного образа.
- Доставка завершена: main опубликован, описание/topics настроены; [CI реализации `4095c3e`](https://github.com/stufently/vkcloud-s3-mcp-ai-cli/actions/runs/38064492739) зелёный.
- Нужна живая проверка: эндпоинты/регионы, условные заголовки, классы/цены, presign, API и ошибки на реальном тестовом бакете с ключом владельца.
- Релиз v0.1.0 и публикация OCI/Registry отложены до живой проверки.

- **[предположение]**: условные заголовки, bucket tagging, multi-AZ, точные байтовые границы/коды квот и региональные тарифы; консервативные ограничения описаны в [ресерче](docs/research/vkcloud-s3.md).

## Обнаружение проекта — 11.10.2026

- Завершено: описание, homepage и 20 topics проверены через GitHub API.
- Завершено: README RU/EN с отдельным сценарием, FAQ провайдера и ссылками на все проекты и общий каталог.
- Проверено в Docker: ссылки README и страниц, восемь PNG/SVG; у провайдеров check_docs (заголовки, compat и Registry schema). Доставлено в main 11.10.2026; статус текущего CI — в [Actions](https://github.com/stufently/vkcloud-s3-mcp-ai-cli/actions).
- Social preview: SVG и PNG 1280×640 готовы в `docs/assets/`; установка в GitHub Settings требует авторизованного браузера администратора. [Инструкция](https://github.com/stufently/s3-mcp-ai-cli-kit/blob/main/docs/social-preview.md).
