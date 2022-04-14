#!/usr/bin/env bash

# Detect platform
if [ "$(uname)" == "Darwin" ]; then
        # MacOS
        raw_cpu_flags=`sysctl -a | grep machdep.cpu.features | cut -d ":" -f 2 | tr '[:upper:]' '[:lower:]'`
elif [ "$(uname)" == "Linux" ]; then
        # GNU/Linux
        raw_cpu_flags=`grep flags -m1 /proc/cpuinfo | cut -d ":" -f 2 | tr '[:upper:]' '[:lower:]'`
else
        echo "Unknown plaform: $(uname)"
        exit -1
fi

COPT="--copt=-march=native"

for cpu_feature in $raw_cpu_flags
do
        case "$cpu_feature" in
                "sse4.1" | "sse4.2" | "ssse3" | "fma" | "cx16" | "popcnt" | "maes")
                    COPT+=" --copt=-m$cpu_feature"
                ;;
                "avx1.0")
                    COPT+=" --copt=-mavx"
                ;;
                *)
                        # noop
                ;;
        esac
done
echo $COPT
