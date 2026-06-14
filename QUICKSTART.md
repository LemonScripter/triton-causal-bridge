# Quickstart: DCC Verified Inference Path for Triton

This guide provides a self-contained environment to verify the **Verified Inference Path** logic for NVIDIA Triton.

## Prerequisites
- **Python 3.8+**
- **Linux** or **macOS**

## Step 1: Clone the Bridge
```bash
git clone https://github.com/LemonScripter/triton-causal-bridge.git
cd triton-causal-bridge
```

## Step 2: Run the Automated Proof
Execute the reproduction script to see the "GPU Resource Protection" logic in action:
```bash
./reproduce.sh
```

## Step 3: Production Deployment
For live GPU protection, the Triton Python backend (`src/dcc_triton_backend.py`) must be deployed within the Triton Inference Server model repository. It will automatically enforce DCC verification for all incoming requests before allocating compute cycles.

## Verification Scenarios
- **Verified:** Inference requests with a valid hardware-anchored token are processed on the GPU.
- **Ghost-Request:** Unauthorized autonomous requests are blocked at the entry point, protecting expensive GPU resources.

---
*Production-Grade Research Prototype by MetaSpace BioOS Team*
