#!/bin/bash
set -e

REPO_URL="https://github.com/thekylehuang/the-kyle-smp.git"
SERVER_DIR="thekylesmp"
PAPER_VERSION="1.21.8"
PAPER_BUILD="25"
PAPER_JAR="paper-${PAPER_VERSION}-${PAPER_BUILD}.jar"
START_SCRIPT="start.sh"

echo "🚀 Welcome to The Kyle SMP Launcher!"

if [ ! -d "$SERVER_DIR" ]; then
	echo "✨ Downloading the server..."
	git clone "$REPO_URL" "$SERVER_DIR"
else
	echo "✨ Pulling the latest changes... (You already have server files)"
	cd "$SERVER_DIR"
	git pull origin main
	cd ..
fi

cd "$SERVER_DIR"

if [ ! -f "paper.jar" ]; then
	echo "🍁 Downloading PaperMC..."
	curl -L -# -o paper.jar "https://fill.papermc.io/v3/projects/paper/versions/${PAPER_VERSION}/builds/${PAPER_BUILD}"
	echo "💦 ${PAPER_JAR} has been installed, renamed to paper.jar"
fi

chmod +x "$START_SCRIPT"

echo "💪 To start the server, run: ./start.sh"
