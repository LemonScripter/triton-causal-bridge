#!/bin/bash
set -e

# DCC Triton Bridge: Automated Reproduction Script
# Validates the Verified Inference Path logic for AI workloads.

echo "--- [1/2] Verifying Causal Inference Logic (Demo Mode) ---"

echo "Test A: Authorized Request (Token 12345)"
RESULT_A=$(python3 src/reproduce_proof.py --demo --token 12345)
echo "$RESULT_A"
if [[ "$RESULT_A" == *"ALLOW"* ]]; then
    echo "[PASS] Verified inference request allowed."
else
    echo "[FAIL] Verified inference request blocked."
    exit 1
fi

echo -e "\nTest B: Ghost Inference Request (Token 99999)"
if python3 src/reproduce_proof.py --demo --token 99999 > /dev/null 2>&1; then
    echo "[FAIL] Ghost request allowed (GPU Resource Leak)."
    exit 1
else
    echo "[PASS] Ghost request blocked (Fail-Closed)."
fi

echo -e "\n--- [2/2] Deployment Integration ---"
echo "In production, this logic is integrated into the Triton"
echo "Python Backend, requiring a DCC_TOKEN for every execution call."

echo -e "\nSUCCESS: Triton Verified Inference Path logic verified."
