#!/bin/bash

# Clone the repository	
git clone https://github.com/mmistakes/minimal-mistakes.git
cd minimal-mistakes

# Ensure we have all the tags
git fetch --tags

# Determine which one is the latest tag and check it out
LATEST_TAG=$(git describe --tags `git rev-list --tags --max-count=1`)
git checkout ${LATEST_TAG}
