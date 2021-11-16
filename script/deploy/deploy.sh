#!/bin/sh

set -e

echo "
ORIGIN_PATH: ${ORIGIN_PATH}
REMOTE_PATH: ${REMOTE_PATH}
PREPARE_COMMAND: ${PREPARE_COMMAND}
ACTION_COMMAND: ${ACTION_COMMAND}"

# check parameter
if [ ! "${HOST}" ]; then
  echo HOST not exists
  exit 1
fi

if [ ! "${PORT}" ]; then
  echo PORT not exists
  exit 1
fi

if [ ! "${ORIGIN_PATH}" ]; then
  echo ORIGIN_PATH not exists
  exit 1
fi

if [ ! "${ORIGIN_PATH}" ]; then
  echo "${ORIGIN_PATH} not exists"
  exit 1
fi

if [ ! "${REMOTE_PATH}" ]; then
  echo REMOTE_PATH not exists
  exit 1
fi

if [ ! "${ACTION_COMMAND}" ]; then
  echo ACTION_COMMAND not exists
  exit 1
fi

# ls file
ls -lh "${ORIGIN_PATH}"

# compress if dir
if [ -d "${ORIGIN_PATH}" ]; then
  IS_DIR=true
  NEW_PATH="origin.tar.gz"
  tar -zcf "${NEW_PATH}" -C "${ORIGIN_PATH}" .
  ORIGIN_PATH=NEW_PATH
fi

# tmp path
TMP_PATH="/tmp/deploy/$(date '+%Y%m%d-%H%M%S')"
echo "
TMP_PATH: ${TMP_PATH}
"
TMP_FILE="${TMP_PATH}/$(basename "${ORIGIN_PATH}")"

# send file
echo "rsync -e ssh -p ${PORT} ${ORIGIN_PATH} root@${HOST}:${TMP_PATH}"

rsync -e "ssh -p ${PORT}" "${ORIGIN_PATH}" "root@${HOST}:${TMP_PATH}"

# command
SSH_ARGS="-o LogLevel=ERROR"
SSH="ssh ${SSH_ARGS} -p ${PORT} ${HOST}"


# ---------------------------------------------

# execute command in remote
${SSH} sh -c "

# ls remote file
echo
ls -lh \"${TMP_PATH}\"

# execute prepare command
if [ \"${PREPARE_COMMAND}\" ]; then
  ${PREPARE_COMMAND}
fi

if [ -e \"${REMOTE_PATH}\" ];then
  rm -rf \"${REMOTE_PATH}-bak\"
  mv \"${REMOTE_PATH}\" \"${REMOTE_PATH}-bak\"
  mkdir -p ${REMOTE_PATH}
fi

if ${IS_DIR}; then
  mkdir -p \"${REMOTE_PATH}\"
  tar -zxf \"${TMP_FILE}\" -C \"${REMOTE_PATH}\"
else
  mkdir -p $(pwd "${REMOTE_PATH}")
  mv \"${TMP_FILE}\" \"${REMOTE_PATH}\"
fi

# ls remote path
echo
ls -lh \"${REMOTE_PATH}\"


"