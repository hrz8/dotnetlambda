#!/bin/bash

# Set script to exit on any errors
set -e

# Clean up previous builds
echo "Cleaning up previous builds..."
rm -rf bin/Release

# Package the Lambda function
echo "Packaging the Lambda function..."
dotnet lambda package \
  --configuration Release \
  --framework net8.0 \
  -farch arm64 \
  --runtime linux-arm64 \
  --output-package bin/Release/net8.0/BookingServerless.zip

# Deploy using Serverless Framework
echo "Deploying the function..."
sls deploy -s local

echo "Deployment completed successfully!"
