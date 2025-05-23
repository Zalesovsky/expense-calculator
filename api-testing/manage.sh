#!/bin/bash

# Цвета для вывода
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Удаляем только образ api-testing, если он существует
echo -e "${YELLOW}Removing old api-testing image if exists...${NC}"
docker rmi api-testing 2>/dev/null || true

echo -e "${YELLOW}Building Docker image...${NC}"
docker build -t api-testing .

echo -e "${YELLOW}Running tests...${NC}"
docker run --rm api-testing

# Проверяем статус выполнения
if [ $? -eq 0 ]; then
  echo -e "${GREEN}All tests passed successfully!${NC}"
else
  echo -e "${RED}Some tests failed. Check the output above for details.${NC}"
fi 