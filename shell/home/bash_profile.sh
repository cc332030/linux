
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

export JAVA_HOME=/home/program/jvm/11-jdk-openj9
export JAVA_HOME_8=/home/program/jvm/8-jdk-openj9
export JAVA_HOME_7=/home/program/jvm/7-jdk

export JAVA_TOOL_OPTIONS=-Dfile.encoding=utf-8

export M2_HOME=/home/program/maven/app

export GRADLE_HOME=/home/program/gradle/app
export GRADLE_USER_HOME=/home/program/gradle/data

PATH=$PATH:$HOME/bin:$JAVA_HOME/bin:$GRADLE_HOME/bin:$M2_HOME/bin

export PATH
