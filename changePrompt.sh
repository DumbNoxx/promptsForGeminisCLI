#!/bin/bash

set -e

PROMPT_CONFIG_DIR="$HOME/.config/geminis"
LILITH_DEV_SOURCE="./lilithDev"
TEACHER_ENGLISH_SOURCE="./profesorIngles"
LILITH_DEV_DEST="$PROMPT_CONFIG_DIR/lilithDev"
TEACHER_ENGLISH_DEST="$PROMPT_CONFIG_DIR/teacherEnglish"
GEMINI_DEST_FILE="$HOME/.gemini/GEMINI.md"

usage() {
  echo "Usage: $0 [lilith|ingles]"
  echo "  lilith: Use the Lilith persona."
  echo "  ingles: Use the English Teacher persona."
  exit 1
}

initialize_config() {
  echo "Initializing configuration in $PROMPT_CONFIG_DIR..."
  mkdir -p "$LILITH_DEV_DEST"
  mkdir -p "$TEACHER_ENGLISH_DEST"
  cp -f "$LILITH_DEV_SOURCE/GEMINI.md" "$LILITH_DEV_DEST/"
  cp -f "$TEACHER_ENGLISH_SOURCE/GEMINI.md" "$TEACHER_ENGLISH_DEST/"
  echo "Initialization complete."
}

if [ -z "$1" ]; then
  usage
fi

if [ ! -d "$PROMPT_CONFIG_DIR" ]; then
  initialize_config
fi

case "$1" in
lilith)
  echo "Switching to Lilith persona..."
  cp -f "$LILITH_DEV_DEST/GEMINI.md" "$GEMINI_DEST_FILE"
  echo "Prompt changed successfully."
  ;;
ingles)
  echo "Switching to English Teacher persona..."
  cp -f "$TEACHER_ENGLISH_DEST/GEMINI.md" "$GEMINI_DEST_FILE"
  echo "Prompt changed successfully."
  ;;
*)
  echo "Error: Invalid option '$1'"
  usage
  ;;
esac
