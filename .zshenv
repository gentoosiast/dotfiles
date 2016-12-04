# locale
#LANG=en_US.UTF-8
#LANGUAGE=en_US.UTF-8
#LC_ADDRESS=ru_RU.UTF-8
#LC_COLLATE=ru_RU.UTF-8
#LC_CTYPE=ru_RU.UTF-8
#LC_IDENTIFICATION=ru_RU.UTF-8
#LC_MEASUREMENT=ru_RU.UTF-8
#LC_MONETARY=ru_RU.UTF-8
#LC_NAME=ru_RU.UTF-8
#LC_NUMERIC=ru_RU.UTF-8
#LC_PAPER=ru_RU.UTF-8
#LC_TELEPHONE=ru_RU.UTF-8
#LC_TIME=ru_RU.UTF-8

# default browser for `urlscan' script for Mutt
#BROWSER=xdg-open

if [[ ! -o LOGIN ]]; then
	source ~/.zpath
fi

# useful if build is failing because of "missing" jni.h
JAVA_HOME=/usr/lib/jvm/java-default-runtime

#export LANG LANGUAGE LC_ADDRESS LC_COLLATE LC_CTYPE LC_IDENTIFICATION LC_MEASUREMENT LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME

export JAVA_HOME
