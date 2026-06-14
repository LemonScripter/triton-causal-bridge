# DCC Triton Bridge Makefile

all: build

build:
	@echo "Hardening Triton DCC Backend..."
	# No compilation needed for Python backend

test-integration:
	@echo "Running Logic Verification (Python)..."
	python3 tests/verify_triton.py

.PHONY: all build test-integration
