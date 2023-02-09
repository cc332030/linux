#!/bin/sh

set -e

if [ "${GITHUB_REPOSITORY}" ]; then
  REPOSITORY_NAME=$(echo "${GITHUB_REPOSITORY}" | cut -d / -f 2 | xargs -I {} basename {} .git)
  echo
  echo "REPOSITORY_NAME: ${REPOSITORY_NAME}"
fi

# shellcheck disable=SC2016
ORIGIN_PATH=$(printf '%s' "${ORIGIN_PATH}" | sed -e "s@\${REPOSITORY_NAME}@${REPOSITORY_NAME}@g")
REMOTE_PATH=$(printf '%s' "${REMOTE_PATH}" | sed -e "s@\${REPOSITORY_NAME}@${REPOSITORY_NAME}@g")
PREPARE_COMMAND=$(printf '%s' "${PREPARE_COMMAND}" | sed -e "s@\${REPOSITORY_NAME}@${REPOSITORY_NAME}@g")
ACTION_COMMAND=$(printf '%s' "${ACTION_COMMAND}" | sed -e "s@\${REPOSITORY_NAME}@${REPOSITORY_NAME}@g")

MULTI_MODULE=${MULTI_MODULE}

echo "
ORIGIN_PATH: ${ORIGIN_PATH}
REMOTE_PATH: ${REMOTE_PATH}
PREPARE_COMMAND: ${PREPARE_COMMAND}
ACTION_COMMAND: ${ACTION_COMMAND}
MULTI_MODULE: ${MULTI_MODULE}"

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

if [ ! -e "${ORIGIN_PATH}" ]; then
  echo "ORIGIN_PATH: ${ORIGIN_PATH} not exists"
  exit 1
fi

if [ ! "${REMOTE_PATH}" ]; then
  echo REMOTE_PATH not exists
  exit 1
fi
REMOTE_PARENT_PATH=$(pwd "${REMOTE_PATH}")

# ls file
#echo "
#ls ORIGIN_PATH"
#ls -lh "${ORIGIN_PATH}"

ORIGIN_TAR=origin.tar
ORIGIN_TAR_GZ=origin.tar.gz

# compress if dir
if [ -d "${ORIGIN_PATH}" ]; then
  IS_DIR=true
  NEW_PATH=$(pwd)/${ORIGIN_TAR_GZ}
  if ${MULTI_MODULE}; then
    rm -rf ~/tmp/origin
    mkdir -p ~/tmp/origin
    echo which find
    which find
    echo ls -alh ORIGIN_PATH=${ORIGIN_PATH}
    ls -alh ${ORIGIN_PATH}
    find "${ORIGIN_PATH}" -name build -not -path "*/node_modules/*" -exec echo {} \;
    find "${ORIGIN_PATH}" -name build -not -path "*/node_modules/*" -exec sh -c 'cp -r {} ~/tmp/origin/`echo {} | sed "s|/build||g" | xargs -I {} basename {}`' \;
    find ~/tmp/origin
    cd ~/tmp/origin
    echo ls -alh
    ls -alh
    ls | xargs -I {} tar -rf ${ORIGIN_TAR} {}
    gzip ${ORIGIN_TAR}
    tar --exclude='*/*/*' -tf ${ORIGIN_TAR_GZ}
  else
    tar -zcvf "${NEW_PATH}" -C "${ORIGIN_PATH}" .
  fi
  ORIGIN_PATH="${NEW_PATH}"
else
  IS_DIR=false
fi

echo "
IS_DIR: ${IS_DIR}"

# tmp path
TMP_PATH="/tmp/deploy-$(date '+%Y%m%d-%H%M%S')"

SSH_ARGS="-o LogLevel=ERROR"
# shellcheck disable=SC2086
scp ${SSH_ARGS} -P "${PORT}" "${ORIGIN_PATH}" "root@${HOST}:${TMP_PATH}"

# ---------------------------------------------

# execute command in remote
# shellcheck disable=SC2086
ssh ${SSH_ARGS} -p "${PORT}" "root@${HOST}" "

set -e

MULTI_MODULE=${MULTI_MODULE}

if [ \"${PREPARE_COMMAND}\" ]; then
  echo
  echo 'execute PREPARE_COMMAND'
  ${PREPARE_COMMAND}
fi

if [ -e \"${REMOTE_PATH}\" ];then
  if ${MULTI_MODULE}; then
    echo before rm
    ls -alh ${REMOTE_PATH}
    tar --exclude='*/*/*' -tf ${TMP_PATH} | xargs -I {} basename {} | xargs -I {} rm -rf "${REMOTE_PATH}/{}"
    echo after rm
    ls -alh ${REMOTE_PATH}
  else
    rm -rf \"${REMOTE_PATH}\"
  fi
fi

if ${IS_DIR}; then
  mkdir -p \"${REMOTE_PATH}\"
  tar -zxf \"${TMP_PATH}\" -C \"${REMOTE_PATH}\"
else
  mkdir -p \"${REMOTE_PARENT_PATH}\"
  mv \"${TMP_PATH}\" \"${REMOTE_PATH}\"
fi

# clean
rm -f \"${TMP_PATH}\"

echo '
ls REMOTE_PATH'
ls -lh \"${REMOTE_PATH}\"

if [ \"${ACTION_COMMAND}\" ]; then
  echo
  echo 'execute ACTION_COMMAND'
  ${ACTION_COMMAND}
fi

"
