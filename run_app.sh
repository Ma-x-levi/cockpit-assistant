#!/bin/bash

# 设置Qt平台插件环境变量
export QT_QPA_PLATFORM=wayland
export QT_DEBUG_PLUGINS=1

# 如果wayland不可用，尝试xcb
if ! ./cockpit-assistant; then
    echo "Wayland不可用，尝试使用offscreen平台..."
    export QT_QPA_PLATFORM=offscreen
    ./cockpit-assistant
fi

