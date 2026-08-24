.PHONY: install
install: ## install dependencies
	uv sync --all-groups
	uv run prek install

.PHONY: lint
lint: ## lint code
	uv run prek

.PHONY: test
test: ## run all tests
	uv run pytest
