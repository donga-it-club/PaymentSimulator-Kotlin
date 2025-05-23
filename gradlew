#!/bin/sh

#
# Copyright © 2015-2021 the original authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

##############################################################################
#
#   Gradle start up script for POSIX generated by Gradle.
#
#   Important for running:
#
#   (1) You need a POSIX-compliant shell to run this script. If your /bin/sh is
#       noncompliant, but you have some other compliant shell such as ksh or
#       bash, then to run this script, type that shell name before the whole
#       command line, like:
#
#           ksh Gradle
#
#       Busybox and similar reduced shells will NOT work, because this script
#       requires all of these POSIX shell features:
#         * functions;
#         * expansions «$var», «${var}», «${var:-default}», «${var+SET}»,
#           «${var#prefix}», «${var%suffix}», and «$( cmd )»;
#         * compound commands having a testable exit status, especially «case»;
#         * various built-in commands including «command», «set», and «ulimit».
#
#   Important for patching:
#
#   (2) This script targets any POSIX shell, not just bash or dash, and is
#       tested with dash, bash, mksh, zsh, and busybox.
#
#   (3) That's why this script avoids extensions provided by bash, ksh, etc,
#       in particular arrays, newer expansions «${var/pat/rep}» and others,
#       pushd/popd, process substitution «<(cmd)», etc.
#
##############################################################################

# Attempt to set APP_HOME

# Resolve links: $0 may be a link
app_path=$0

# Need this for daisy-chained symlinks.
while
    APP_HOME=${app_path%"${app_path##*/}"}  # leaves a trailing /; empty if no leading path
    [ -h "$app_path" ]
do
    ls=$( ls -ld "$app_path" )
    link=${ls#*' -> '}
    case $link in             #(
      /*)   app_path=$link ;; #(
      *)    app_path=$APP_HOME$link ;;
    esac
done

# This is normally unused
# shellcheck disable=SC2034
APP_BASE_NAME=${0##*/}
# Discard cd standard output in case $CDPATH is set (https://github.com/gradle/gradle/issues/25036)
APP_HOME=$( cd "${APP_HOME:-./}" > /dev/null && pwd -P ) || exit

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD=maximum

warn () {
    echo "$*"
} >&2

die () {
    echo
    echo "$*"
    echo
    exit 1
} >&2

# OS specific support (must be 'true' or 'false').
cygwin=false
msys=false
darwin=false
case "$( uname )" in                #(
  CYGWIN* )         cygwin=true  ;; #(
  Darwin* )         darwin=true  ;; #(
  MSYS* | MINGW* )  msys=true    ;; #(
esac

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # IBM's JDK on AIX uses strange locations for the executables
        JAVACMD=$JAVA_HOME/jre/sh/java
    else
        JAVACMD=$JAVA_HOME/bin/java
    fi
    if [ ! -x "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
    fi
else
    JAVACMD=java
    if ! command -v java >/dev/null 2>&1
    then
        die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
    fi
fi

# Check Java version
JAVA_VERSION=$("$JAVACMD" -version 2>&1 | grep -E "java version|openjdk version"| awk '{ print $3 }' | tr -d '"')
JAVA_MAJOR_VERSION=$(echo "$JAVA_VERSION" | cut -d. -f1)
if [ "$JAVA_MAJOR_VERSION" -lt 8 ]; then
    die "ERROR: Gradle requires Java 8 or higher to run. Your Java version is $JAVA_VERSION."
fi

# Increase the maximum file descriptors if we can.
if ! "$cygwin" && ! "$darwin" && ! "$msys" ; then
    case $MAX_FD in #(
      max*)
        # In POSIX sh, ulimit -H is undefined. That's why the result is checked to see if it worked.
        # shellcheck disable=SC3045
        MAX_FD=$( ulimit -H -n ) ||
            warn "Could not query maximum file descriptor limit"
    esac
    case $MAX_FD in  #(
      '' | soft) :;; #(
      *)
        # shellcheck disable=SC3045
        ulimit -n "$MAX_FD" ||
            warn "Could not set maximum file descriptor limit to $MAX_FD"
    esac
fi

# Collect all arguments for the java command, stacking in reverse order:
#   * args from the command line
#   * the main class name
#   * -classpath
#   * -D...appname settings
#   * --module-path (only if needed)
#   * DEFAULT_JVM_OPTS, JAVA_OPTS, and GRADLE_OPTS environment variables.

# For Cygwin or MSYS, switch paths to Windows format before running java
if "$cygwin" || "$msys" ; then
    APP_HOME=$( cygpath --path --mixed "$APP_HOME" )
    CLASSPATH=$( cygpath --path --mixed "$CLASSPATH" )

    JAVACMD=$( cygpath --unix "$JAVACMD" )

    # Now convert the arguments - kludge to limit ourselves to /bin/sh
    for arg do
        if
            case $arg in                                #(
              -*)   false ;;                            # don't mess with options #(
              /?*)  t=${arg#/} t=/${t%%/*}              # looks like a POSIX filepath
                    [ -e "$t" ] ;;                      #(
              *)    false ;;
            esac
        then
            arg=$( cygpath --path --ignore --mixed "$arg" )
        fi
        # Roll the args list around exactly as many times as the number of
        # args, so each arg winds up back in the position where it started, but
        # possibly modified.
        #
        # NB: a `for` loop captures its iteration list before it begins, so
        # changing the positional parameters here affects neither the number of
        # iterations, nor the values presented in `arg`.
        shift                   # remove old arg
        set -- "$@" "$arg"      # push replacement arg
    done
fi


# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS='"-Xmx64m" "-Xms64m"'

# Collect all arguments for the java command:
#   * DEFAULT_JVM_OPTS, JAVA_OPTS, JAVA_OPTS, and optsEnvironmentVar are not allowed to contain shell fragments,
#     and any embedded shellness will be escaped.
#   * For example: A user cannot expect ${Hostname} to be expanded, as it is an environment variable and needs to be
#     evaluated by the JVM not the shell.
#   * See https://github.com/gradle/gradle/issues/21272
build_app_directory_structure() {
  APP_HOME=$1
  if [ -n "$GRADLE_HOME" ]; then
    echo "$GRADLE_HOME/lib/gradle-launcher-*.jar"
  elif [ -d "$APP_HOME/lib" ]; then
    echo "$APP_HOME/lib/gradle-launcher-*.jar"
  else
    echo "$APP_HOME/gradle/wrapper/gradle-wrapper.jar"
  fi
}

sampleJavaOpts() {
  javaOpts="${1:-}"
  sampleJavaOpts=$(printf '%s\n' "$javaOpts" | sed -n '/^-/p')
  remaining=$(printf '%s\n' "$javaOpts" | sed -n '/^[^-]/p')
  echo "$sampleJavaOpts" "$remaining"
}

createXmxArg() {
  javaOpt="${1:-}"
  echo "$javaOpt" | sed -n '/^-Xmx/p'
}

# Collect all arguments for the java command;
#   * $DEFAULT_JVM_OPTS, $JAVA_OPTS, $GRADLE_OPTS are not shells scripts, so their inner content can't be expanded.
#   * These values can contain shell variables that need to be expanded when passing them to java.
#   * The -classpath argument must be a single, not a separated list of jars.
#   * The variable GRADLE_LAUNCHER is an artificial variable that only used as a navigation for the code flow.
CLASSPATH=$(build_app_directory_structure "$APP_HOME")
JVM_OPTS=${DEFAULT_JVM_OPTS:-}
JVM_OPTS=$(sampleJavaOpts "$JVM_OPTS $JAVA_OPTS $GRADLE_OPTS")
XMX_ARG=$(createXmxArg "$JVM_OPTS")
if [ -z "$XMX_ARG" ]; then
  JVM_OPTS="$JVM_OPTS -Xmx512m"
fi

# Append tmp to the JVM_OPTS/GRADLE_OPTS values
if [ -d "$APP_HOME/tmp/gradle" ]; then
  echo "$JVM_OPTS" | grep -q '\-Djava\.io\.tmpdir=' ||
    (mkdir -p "$APP_HOME/tmp/gradle" && JVM_OPTS="$JVM_OPTS -Djava.io.tmpdir=$APP_HOME/tmp/gradle")
fi

exec "$JAVACMD" $JVM_OPTS \
  -classpath "$CLASSPATH" \
  org.gradle.launcher.GradleMain \
  "$@" 