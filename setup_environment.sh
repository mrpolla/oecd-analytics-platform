#!/bin/bash
echo "🚀 Setting up OECD Analytics Platform Environment"

# Check if conda is installed
if ! command -v conda &> /dev/null; then
    echo "❌ Conda not found. Please install Anaconda/Miniconda first."
    exit 1
fi

# Create conda environment if it doesn't exist
if ! conda env list | grep -q "oecd-platform"; then
    echo "📦 Creating conda environment..."
    conda create -n oecd-platform python=3.10 -y
fi

# Activate environment
echo "🔄 Activating environment..."
source $(conda info --base)/etc/profile.d/conda.sh
conda activate oecd-platform

# Install requirements
echo "📚 Installing Python packages..."
pip install -r requirements.txt

echo "✅ Environment setup complete!"
echo "To activate: conda activate oecd-platform"