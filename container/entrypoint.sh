#!/bin/sh -x

echo n | $ANDROID_HOME/tools/bin/avdmanager create avd \
    -k "system-images;${TARGET};${TAG};${ABI}" \
    -n ${NAME} -b ${ABI} -g ${TAG} ${ANDROID_AVD_EXTRA_ARGS}

(
  # Enable keyboard support in QEMU (for VNC)
  echo 'hw.keyboard = true';
) >> /root/.android/avd/Docker.avd/config.ini

adb start-server

exec $*
